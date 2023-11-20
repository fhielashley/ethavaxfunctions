// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint256 public totalSupply;

    mapping(address => uint256) private balances;
    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);
    event Mint(address indexed to, uint256 value);

    constructor() {
        name = "My Token";
        symbol = "MTK";
        owner = msg.sender;
        totalSupply = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    function mint(address to, uint256 value) public onlyOwner {
        require(to != address(0), "Invalid address");
        require(value > 0, "Invalid value");

        balances[to] += value;
        totalSupply += value;

        emit Mint(to, value);
        emit Transfer(address(0), to, value);
    }

    function transfer(address to, uint256 value) public {
        require(to != address(0), "Invalid address");
        require(value > 0, "Invalid value");
        require(balances[msg.sender] >= value, "Insufficient balance");

        balances[msg.sender] -= value;
        balances[to] += value;

        emit Transfer(msg.sender, to, value);
    }

    function burn(uint256 value) public {
        require(value > 0, "Invalid value");
        require(balances[msg.sender] >= value, "Insufficient balance");

        balances[msg.sender] -= value;
        totalSupply -= value;

        emit Burn(msg.sender, value);
        emit Transfer(msg.sender, address(0), value);
    }

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
}