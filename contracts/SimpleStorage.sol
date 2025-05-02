// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; //solidity versions

contract SimpleStorage {
    // unit 256 and only unit are same thing and if no number is specified after = that means default value 0
    uint256 public myfavoriteNumber;  //0 and adding public will display the stored number or else default is internal

    // uint256[] listofFavoriteNumbers; // [2,58,65, 1st number is always the 0th element]

    struct Person {
    uint256 favoriteNumber; // 0
        string name;             // ""       
    }

    Person [] public listofPeople; //[] Blank List (Also called dynamic array since it can grow)
    // Person public ray = Person ({favoriteNumber:6, name: "Roy"});

    mapping(string => uint256) public nameTofavoriteNumber;


    function store (uint256 _favoriteNumber) public virtual {   // adding virtual keyword makes it overridable when used later
        myfavoriteNumber = _favoriteNumber;
    }
//view,pure does'nt costs any gas since its not modifying. will cost if called within a gas function, ex: store function
function retrieve () public view returns (uint256){
    return myfavoriteNumber;
}

function addPerson (string memory _name, uint256 _favoriteNumber) public {
    listofPeople.push(Person(_favoriteNumber, _name));
    nameTofavoriteNumber [_name] = _favoriteNumber;
}
}
