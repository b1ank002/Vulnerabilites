// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Rejecter {

    fallback() external payable {
        revert("no");
    }
}