// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

// Tx.origin Vulnerability
contract DepositWallet {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function transferFunds(address payable _to, uint256 _amount) external {
        require(tx.origin == owner);
        // require(msg.sender == owner); safe

        // _to.transfer(_amount);
        (bool success, ) = _to.call{value: _amount}("");
        require(success);
    }

    function deposit() external payable {}
}