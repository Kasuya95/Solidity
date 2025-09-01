// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Lottery{
    uint public winnerIndex;
    address public winnerPlayer;
    address public  manager;
    address[] public  players;
constructor() {
    manager = msg.sender;
}
function enter() public payable {
    require(msg.value >= 0.005 ether, "add money now!!!");
    players.push(msg.sender);

}
function pickWinner() public {
    require(msg.sender == manager,"Only manager");
    uint index = random() % players.length;
    winnerIndex = index;
    (bool success,) = players[index].call{value: (address(this).balance)}("");
    require(success,"transfer failed");
    winnerPlayer = players[index];
    players = new address [](0);
}
function random() private view returns (uint){
    return uint(keccak256(abi.encodePacked(block.prevrandao,block.timestamp,players)));
}
function totalParticipant() public view returns (uint) {
    return players.length;
}

}       