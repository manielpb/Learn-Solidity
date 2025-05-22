//Get funds from users
//withdraw funds
// Set minimum funding value in USD

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import{PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundME{

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable{
        require(msg.value.getConversionRate() > MINIMUM_USD, "didn't send enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        }

    function withdraw() public onlyOwner{
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) 
            {
               address funder =  funders[funderIndex];
               addressToAmountFunded[funder] = 0;
            }
        funders = new address[](0);

        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");
    }

    modifier onlyOwner(){
         //require(msg.sender == i_owner, "Must be owner!");
         if(msg.sender != i_owner){
            revert NotOwner();
         }
         _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
    


}

