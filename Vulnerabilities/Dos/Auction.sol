// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Auction {

    address private highestBidder;

    uint256 private highestBid;
    uint256 private auctionEnd;

    constructor() {
        auctionEnd = block.timestamp + 600;
    }

    function bid() external payable {
        require(msg.value > highestBid);
        require(block.timestamp <= auctionEnd);


        uint256 previousBid = highestBid;
        address previousBidder = highestBidder;

        highestBid = msg.value;
        highestBidder = msg.sender;

        (bool success, ) = payable(previousBidder).call{value: previousBid}("");
        require(success);
    }

    function getHighestBid() external view returns (uint256) {
        return  highestBid;
    }
}