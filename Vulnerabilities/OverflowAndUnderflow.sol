// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint8 public score;

    function increment() public {
        unchecked {
            score++;
        }
    }

    function decrement() public {
        unchecked {
            score--;
        }
    }

    function setMaxScore() public {
        score = 255;
    }
}