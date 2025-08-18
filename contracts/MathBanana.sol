    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.26;

    contract MathBanana{
        uint public a = 50;
        uint public b = 30; 

        function plus() public view returns (uint) {
        return   a + b ;
        }

        function minus() public view returns (uint) {
        return a - b;
        }

        function multiply() public view returns (uint) {
        return a * b;
        }

        function divide() public view returns (uint) {
        return a / b;
        } 

        function divideab() public view returns (uint) {
        return a % b; 
        }
        function avg(uint x, uint y, uint z) public pure returns (uint){
             
             return  (x + y + z) / 3;

        }
    }       