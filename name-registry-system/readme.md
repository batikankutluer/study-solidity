# Name Registry System

This contract is created for educational purposes. You are free to use and modify it in any way you like.
* [name-registry-system.sol](./name-registry-system/readme.md)

## Add Functions

> This function adds a user's information (name and timestamp) to the mapping of registered users.

```solidity
function addName(string memory name) public payable returns(bool){...
```

Here is the definition of the mapping and struct:

```solidity
struct NAME_STRUCT {
    string name;
    uint timestamp;
}

mapping(address => NAME_STRUCT[]) public names;
```

---

## Get Functions

> This function returns the name that the user registered.

```solidity
function getName(address user) public view returns(string memory){...
```

> This function returns the names registered by a user.

```solidity
function getNames(address user) public view returns(string[] memory){...
```

Study Web3! - Made by **Batıkan Kutluer**
