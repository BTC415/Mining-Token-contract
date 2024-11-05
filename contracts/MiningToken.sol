//SPDX-License-Identifier:MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract MiningToken is ERC20Capped, ERC20Burnable {
    address payable public owner;
    uint256 public blockReward;

    constructor(
        uint256 cap,
        uint256 reward
    ) ERC20("MintingToken", "MNT") ERC20Capped(cap * 10 ** decimals()) {
        owner = payable(msg.sender);
        _mint(owner, 5000000 * 10 ** decimals());
        blockReward = reward * 10 ** decimals();
    }
}
