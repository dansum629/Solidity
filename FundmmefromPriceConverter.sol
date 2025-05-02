// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimumUsd = 5 * 1e18;

    address [] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded; // keep track of funders and their addresses

    function fund () public payable {

        require (msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");  

        // since 1st input variable inside getConversionRate is uint256 in PriceConverter library
        // msg.value is a type uint256 that gets passed on above line with getConversionRate

        funders.push (msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    // specifying min funds to be at greater than 1 Ether
    // returns msg if enough funds are not sent
    }
    // function withdraw () public{}
}