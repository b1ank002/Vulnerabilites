// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Donator {
    bool public isDonationDone;

    function donate(address _to) external payable {
        payable(_to).send(msg.value);
        isDonationDone = true;
    }

    function safeDonate(address _to) external payable {
        bool success = payable(_to).send(msg.value);
        require(success);
        isDonationDone = true;
    }
}