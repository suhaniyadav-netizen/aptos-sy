module MyModule::BlockchainPolls {
    use aptos_framework::signer;
    use std::vector;
    use std::string::String;
    
    /// Struct representing a poll with voting options and results.
    struct Poll has store, key {
        question: String,           // The poll question
        options: vector<String>,    // List of voting options
        votes: vector<u64>,         // Vote count for each option
        voters: vector<address>,    // Addresses that have already voted
        is_active: bool,           // Whether the poll is still accepting votes
    }
    
    /// Error codes
    const E_POLL_NOT_FOUND: u64 = 1;
    const E_INVALID_OPTION: u64 = 2;
    const E_ALREADY_VOTED: u64 = 3;
    const E_POLL_INACTIVE: u64 = 4;
    
    /// Function to create a new poll with multiple options.
    public fun create_poll(
        creator: &signer, 
        question: String, 
        options: vector<String>
    ) {
        let option_count = vector::length(&options);
        let votes = vector::empty<u64>();
        
        // Initialize vote counts to zero for each option
        let i = 0;
        while (i < option_count) {
            vector::push_back(&mut votes, 0);
            i = i + 1;
        };
        
        let poll = Poll {
            question,
            options,
            votes,
            voters: vector::empty<address>(),
            is_active: true,
        };
        
        move_to(creator, poll);
    }
    
    /// Function for users to cast their vote on a specific poll option.
    public fun cast_vote(
        voter: &signer, 
        poll_owner: address, 
        option_index: u64
    ) acquires Poll {
        let voter_addr = signer::address_of(voter);
        let poll = borrow_global_mut<Poll>(poll_owner);
        
        // Check if poll is active
        assert!(poll.is_active, E_POLL_INACTIVE);
        
        // Check if option index is valid
        assert!(option_index < vector::length(&poll.options), E_INVALID_OPTION);
        
        // Check if voter has already voted
        assert!(!vector::contains(&poll.voters, &voter_addr), E_ALREADY_VOTED);
        
        // Record the vote
        let current_votes = vector::borrow_mut(&mut poll.votes, option_index);
        *current_votes = *current_votes + 1;
        
        // Add voter to the list of voters
        vector::push_back(&mut poll.voters, voter_addr);
    }
}