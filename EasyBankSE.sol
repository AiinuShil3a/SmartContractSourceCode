// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract easyWallet {
    mapping(address => uint)  balace; //public  balace;

    function getBalace() public  view returns (uint) {
        return balace[msg.sender];
    }

    function deposit() public payable  {
        balace[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public  {
        require(balace[msg.sender] >= amount, "Insufficient balance");
        balace[msg.sender] -= amount;
        (bool success ,) = msg.sender.call{value: amount}("");
        require(success, "Failer");
    }
}