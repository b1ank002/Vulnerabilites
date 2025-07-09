// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Rewarder {
    address[] public users;

    function processBatch(uint256 start, uint256 end) public {
        for (uint256 i = start; i < end; i++) {
            payable(users[i]).transfer(1 wei);
        }
    }
}