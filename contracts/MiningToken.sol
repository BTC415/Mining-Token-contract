//SPDX-License-Identifier:MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract MiningToken is ERC20Capped, Ownable {
    uint256 public reward;
    uint256 public blockReward;

    constructor(
        uint256 cap_,
        uint256 reward_
    )
        ERC20("MiningToken", "MNT")
        ERC20Capped(cap_ * (10 ** decimals()))
        Ownable(msg.sender)
    {
        reward = reward_;
        _mint(msg.sender, 50000000 * (10 ** decimals()));
        blockReward = reward * (10 ** decimals()); // Setting block reward for first deploy
    }

    // Setting miner reward
    function _mintMinerReward() internal {
        _mint(block.coinbase, blockReward);
    }

    // block.conbase validation for rewarding the minder; prevents miner from manipulating teh token
    function _update(
        address from,
        address to,
        uint256 value
    ) internal virtual override {
        if (
            from != block.coinbase &&
            to != block.coinbase &&
            block.coinbase != address(0)
        ) {
            _mintMinerReward();
        }
        super._update(from, to, value);
    }

    function _mint(
        address account,
        uint256 amount
    ) internal virtual override(ERC20) {
        require(
            ERC20.totalSupply() + amount <= cap(),
            "ERC20Capped: cap exceeded"
        );
        super._mint(account, amount);
    }

    // Set block rewards
    function setBlockReward(uint256 newReward_) public onlyOwner {
        uint256 oldReward = reward;
        reward = newReward_;
        blockReward = reward * (10 ** decimals());
    }
}
