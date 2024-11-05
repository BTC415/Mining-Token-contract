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

    function _mint(
        address account,
        uint256 amount
    ) internal virtual override(ERC20) {}

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {}

    function _mintMinerReward() internal {}

    function setReward(uint256 reward) public onlyOwner{

    }

    function destroyContract() public onlyOwner {}

    modifier onlyOwner() {
      require(msg.sender == owner, "You are not the owner");
      _;
    }
}
