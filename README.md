# Blockchain Based Polls

A simple smart contract for creating and managing polls on the Aptos blockchain.

## What is this?

This project lets you create polls that live on the blockchain. Once a poll is created, people can vote on it, and all votes are permanently recorded and can't be changed or faked.

## Features

- Create polls with multiple choice options
- Vote on existing polls
- Prevents people from voting twice
- All results are stored permanently on the blockchain
- Completely transparent and tamper-proof

## How it works

### Creating a Poll

Anyone can create a poll by calling the `create_poll` function with:
- A question (like "What's your favorite programming language?")
- A list of options (like ["Python", "JavaScript", "Rust", "Move"])

### Voting

To vote on a poll:
- Call the `cast_vote` function
- Specify which option you want to vote for
- The system checks that you haven't voted before
- Your vote gets recorded permanently

## Smart Contract Functions

### `create_poll(creator, question, options)`
Creates a new poll with your question and answer choices.

### `cast_vote(voter, poll_owner, option_index)`
Lets you vote on someone's poll by picking one of the options.

## Security Features

- **No double voting**: Each address can only vote once per poll
- **Immutable results**: Once votes are cast, they can't be changed
- **Transparent**: Anyone can verify the results
- **Decentralized**: No single authority controls the polls

## Getting Started

1. Deploy the smart contract to Aptos blockchain
2. Create a poll using the `create_poll` function
3. Share your poll with others so they can vote
4. Watch the results update in real-time on the blockchain

## Why use blockchain for polls?

Traditional polls can be manipulated or hacked. By using blockchain:
- Results are impossible to fake
- Everyone can verify the vote counts
- No central authority can change results
- Votes are permanent and transparent

## Requirements

- Aptos wallet
- Basic understanding of blockchain transactions
- Move programming language knowledge (for developers)

## License

This project is open source and available for anyone to use or modify.
