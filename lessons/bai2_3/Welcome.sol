// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Welcome {
    string public greeting;

    constructor(string memory initialGreeting) {
        greeting = initialGreeting;
    }

    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}
