// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    struct Student {
        string name;
        uint age;
        bool isRegistered;
    }

    mapping(address => Student) private students;

    event StudentRegistered(address indexed user, string name, uint age);

    function register(string memory name, uint age) public {
        require(!students[msg.sender].isRegistered, "Already registered");
        require(age > 0, "Age must be greater than 0");

        students[msg.sender] = Student({name: name, age: age, isRegistered: true});

        emit StudentRegistered(msg.sender, name, age);
    }

    function getStudent(address user) public view returns (string memory, uint256, bool) {
        Student memory student = students[user];
        return (student.name, student.age, student.isRegistered);
    }

    function isStudentRegistered(address user) public view returns (bool) {
        return students[user].isRegistered;
    }
}