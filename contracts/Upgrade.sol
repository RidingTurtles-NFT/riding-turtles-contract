// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

// this is only used for testing

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Ownable.sol";
import "./StandardErc20Token.sol";

contract Upgrade is StandardErc20Token {
    bool private _readyToUpgrade = false;
    address private _upgradable = address(0);

    modifier onlyReadyToUpgrade() {
        require(_readyToUpgrade, "Upgrade: not ready");
        _;
    }

    constructor (string memory name, string memory symbol, uint256 initialSupply) StandardErc20Token(name, symbol, initialSupply) {
    }

    function setReadyToUpgrade(address upgradable) external onlyOwner {
        require(upgradable != address(0));
        require(!_readyToUpgrade);
        uint codeLength;
        assembly {
            codeLength := extcodesize(upgradable)
        }
        require(codeLength > 0, "Upgrade: Upgradable contract address is not a contract");
        _upgradable = upgradable;
        _readyToUpgrade = true;
    }

    function stopUpgrade() external onlyOwner {
        _readyToUpgrade = false;
    }

    function upgrade(address upgrader, uint256 amount) external onlyReadyToUpgrade returns (bool) {
        require(_upgradable == msg.sender, "Upgrade: msg.sender is not correct contract");
        _mint(upgrader, amount);
        return true;
    }
}
