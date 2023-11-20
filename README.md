# ethavaxfunctions

Overview

This code represents the three functionality of the needed program which only contract owner should be able to mint tokens, any user can transfer tokens and any user can burn tokens

1.The MyToken contract is defined. It represents an ERC20 token.
2.The contract has several state variables:
name and symbol represent the name and symbol of the token, respectively. They are publicly accessible.
totalSupply represents the total supply of tokens in circulation.
3.balances is a mapping that stores the token balance of each address. It is private to the contract.
owner represents the address of the contract owner.
4.The contract defines three events:
5.Transfer event is emitted when tokens are transferred from one address to another.
6.Burn event is emitted when tokens are burned (destroyed).
7.Mint event is emitted when new tokens are minted (created).
8.The constructor is invoked when the contract is deployed. It sets the initial values for name, symbol, owner, and totalSupply.
9.The onlyOwner modifier is defined. It restricts access to certain functions only to the contract owner.
10.The mint function allows the contract owner to mint new tokens and assign them to a specified address. It checks for valid inputs and updates the balances and total supply accordingly.
11.The transfer function allows any user to transfer tokens from their own address to another address. It checks for valid inputs and updates the balances accordingly.
12.The burn function allows any user to burn (destroy) their own tokens. It checks for valid inputs and updates the balances and total supply accordingly.
13.The balanceOf function allows users to check the token balance of a specific address.
