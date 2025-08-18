// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EasyBank{
    mapping(address => uint256)  balances;
    function getBalance() public view returns(uint256){
        return balances[msg.sender];
    }
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint256 amount) public payable {
        require(balances[msg.sender]>=amount,"Insufficient Money tp withdraw!!!");
        balances[msg.sender] - amount;
        (bool success,) = msg.sender.call{value:amount}("");
        require(success,"Withdrawal Failed!!!");
    }
}       