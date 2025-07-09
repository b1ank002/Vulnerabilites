// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract SafeAuction {

    address private highestBidder;

    uint256 private highestBid;
    uint256 private auctionEnd;

    mapping (address => uint256) public refunds;

    constructor() {
        auctionEnd = block.timestamp + 600;
    }

    function bid() external payable {
        require(msg.value > highestBid);
        require(block.timestamp <= auctionEnd);

        refunds[highestBidder] += highestBid;

        highestBid = msg.value;
        highestBidder = msg.sender;
    }

    function getHighestBid() external view returns (uint256) {
        return  highestBid;
    }

    function refund() external {
        uint256 amount = refunds[msg.sender];
        require(amount > 0);

        refunds[msg.sender] = 0;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success);
    }
}