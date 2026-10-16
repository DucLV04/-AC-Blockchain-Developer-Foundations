// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistryV2 {
    struct Student {
        string name;
        uint age;
        bool isRegistered;
    }

    address public owner;
    mapping(address => Student) private students;

    event StudentAdded(address indexed user, string name, uint age);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerStudent(address user, string memory name, uint age) public onlyOwner {
        require(!students[user].isRegistered, "Student already registered");
        require(age > 0, "Age must be greater than 0");

        students[user] = Student({name: name, age: age, isRegistered: true});

        emit StudentAdded(user, name, age);
    }

    function getStudent(address user) public view returns (string memory, uint256, bool) {
        Student memory student = students[user];
        return (student.name, student.age, student.isRegistered);
    }

    function isStudentRegistered(address user) public view returns (bool) {
        return students[user].isRegistered;
    }
}