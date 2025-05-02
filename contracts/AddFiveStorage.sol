// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    // This contract is a child contract of Simple Storage and has all the functionality of Simple Storage 
    // we want the store function to add 5 everytime a numbe ris stored using OVERRIDE function

    function store (uint256 _newNumber) public override {
        myfavoriteNumber = _newNumber + 5;
    }

}