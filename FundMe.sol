// Get funds from users
// Withdraw Funds
// Set a min funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 5 * 1e18;

    address [] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded; // keep track of funders and their addresses

    function fund () public payable {
        // function allows users to send $
        // have min $ sent 
        require (getConversionRate(msg.value) >= minimumUsd, "didn't send enough ETH");  
        funders.push (msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    // specifying min funds to be at greater than 1 Ether
    // returns msg if enough funds are not sent
    }
    // function withdraw () public{}

// to get price of ETH in USD
    function getPrice() public view returns (uint256) {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI 
        AggregatorV3Interface priceFeed = AggregatorV3Interface (0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // (address)  --> AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); 
        (,int256 price,,,) = priceFeed.latestRoundData();       // (,,,) need to be left inside since original reverts 5 values as per datafeeds
        // Price of ETH in terms of USD
        return uint256 (price*1e10);
        
        }

        function getConversionRate (uint256 ethAmount) public view returns(uint256) {
            uint256 ethPrice = getPrice();
            uint256 ethAmountInUsd = (ethPrice*ethAmount) / 1e18;
            return ethAmountInUsd;
        }
     // to convert the ETH into USD
    function getVersion () public view returns (uint256) {
        return AggregatorV3Interface (0x694AA1769357215DE4FAC081bf1f309aDC325306). version ();
    } 
}