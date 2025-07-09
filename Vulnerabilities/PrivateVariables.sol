// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract PrivateIsNotSafe {
    // every node can check from bytecode
    address private myAddress;

    // Commit-reveal - we hashing our data and send hash then when we
    // need we show original and contract check that everything matches
}