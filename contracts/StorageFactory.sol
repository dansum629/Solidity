// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "./SimpleStorage.sol"; // if a contract has multiple contracts within, we can import it byspecifying using {contract x, contract y} in front of ./

contract StorageFactory{

    // unit256 public favoriteNumber
    // type visibility name
    SimpleStorage[] public listofSimpleStorageContracts;

    function createSimpleStorageContract() public{
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listofSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // to interact with contract 2 things: need ADDRESS & ABI

    SimpleStorage mySimpleStorage = listofSimpleStorageContracts[_simpleStorageIndex];
    // Instead we can use : listofSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        // to read from contract 1 things: need ADDRESS & ABI, but we dont want the user to get information from this address. So in order for them to do it we use view
        SimpleStorage mySimpleStorage = listofSimpleStorageContracts[_simpleStorageIndex];
        // Instead we can use : return listofSimpleStorageContracts[_simpleStorageIndex]. retrieve();
        return mySimpleStorage.retrieve();
    }
}
