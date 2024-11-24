// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract name_registry_system {

    struct NAME_STRUCT {
        string name;
        uint timestamp;
    }

    mapping(address => NAME_STRUCT[]) public names;

    function addName(string memory name) public payable returns(bool){
        require(msg.value >= 0.1 ether, "You don't have enough ether. (equal or more than 0.1)");

        uint returnValue = msg.value - (0.1 ether);

        names[msg.sender].push(NAME_STRUCT({
            name: name,
            timestamp: block.timestamp
        }));

        (bool success, ) = payable(msg.sender).call{value: returnValue}("");
        require(success, "Transfer failed."); 

        return success;
    }

    function getNames(address user) public view returns(string[] memory){
        require(names[user].length > 0, "User doesn't have a name in the system.");

        uint length = names[user].length;
        string[] memory tempNames = new string[](length);

        for (uint i = 0; i < length; i++) 
        {
            tempNames[i] = string.concat(names[user][i].name, ".eth");
        }
        
        return tempNames;
    }

    function getName(address user) public view returns(string memory){
        require(names[user].length > 0, "User doesn't have a name in the system.");
        require(names[user].length == 1, "User has more than 1 name, please use getNames function instead.");
        return string.concat(names[user][0].name, ".eth");
    }
}
