// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

// this is only used for testing

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Ownable.sol";
import "./TokenHolder.sol";

contract StandardErc20Token is ERC20, Ownable, TokenHolder {
    event PaymentReceived(address from, uint256 amount);

    constructor (string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        uint256 supply = initialSupply * (10 ** uint256(decimals()));
        _mint(msg.sender, supply);
    }

    function payout(address payable receiver, uint256 amount) external onlyOwner {
        require(address(this).balance >= amount, "AM8");
        (bool payoutSuccess, ) = receiver.call{value: amount}("");
        require(payoutSuccess, "OT15");
    }

    receive () external virtual payable {
        emit PaymentReceived(msg.sender, msg.value);
    }
}

