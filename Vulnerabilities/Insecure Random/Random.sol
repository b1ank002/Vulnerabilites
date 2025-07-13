// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Random {

    function getRandomNumber () public view returns (uint256) {
        return uint256(
            keccak256(
                abi.encodePacked(
                    block.timestamp,
                    block.prevrandao,
                    msg.sender
                )
            )
        );
    }
}