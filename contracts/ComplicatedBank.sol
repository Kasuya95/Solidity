// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ComplicatedBank{
    mapping(address => uint256)  balances;
    address[] accounts;
    uint public rate = 3;
    address public owner;

    constructor()  {
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function getSystemBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }
    function calculateInterest(address account) public view   returns (uint256){
        uint interests = balances[account] * rate / 100;
        return interests;
    }
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        accounts.push(msg.sender);
    }
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    
    
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}