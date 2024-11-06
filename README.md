# Mining Token Contract (MNT)

A sophisticated ERC20 token implementation with mining rewards functionality built on the Ethereum blockchain.

## Features

- **Capped Supply**: Token has a maximum supply limit defined at deployment
- **Mining Rewards**: Miners receive automatic token rewards for block validation
- **Ownership Control**: Contract includes owner-specific functions for parameter management
- **Decimal Support**: Full decimal support (18 decimals) for token operations
- **Initial Supply**: 50,000,000 tokens minted to deployer at contract creation
- **Adjustable Block Rewards**: Owner can modify mining reward amounts

## Technical Details

### Token Specifications
- Name: MiningToken
- Symbol: MNT
- Decimals: 18
- Initial Supply: 50,000,000 MNT
- Supply Cap: Defined at deployment

### Smart Contract Architecture

The contract inherits from:
- `ERC20Capped`: Implements maximum supply cap functionality
- `Ownable`: Provides ownership control mechanisms
- `ERC20`: Base token implementation

### Key Functions

1. **Constructor**
   - Sets token cap and initial mining reward
   - Mints initial supply to contract deployer

2. **Mining Reward System**
   - Automatic reward distribution to miners
   - Anti-manipulation checks for miner rewards
   - Configurable reward amounts

3. **Administrative Functions**
   - `setBlockReward`: Allows owner to adjust mining rewards
   - Protected minting with cap validation

## Usage

1. Deploy the contract with parameters:
   - `cap_`: Maximum token supply
   - `reward_`: Initial block mining reward

2. Miners automatically receive rewards when processing transactions

3. Contract owner can adjust mining rewards using `setBlockReward`

## Security Features

- Supply cap enforcement
- Protected minting mechanism
- Miner reward validation
- Owner-only administrative functions

## Dependencies

- OpenZeppelin Contracts v4.x
  - ERC20
  - ERC20Capped
  - Ownable

## License

MIT License
