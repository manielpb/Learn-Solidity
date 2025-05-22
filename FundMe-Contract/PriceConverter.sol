//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

 import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

   

    function getPrice()internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int price,,,) = priceFeed.latestRoundData();
        return uint(price) * 1e10;
        }

    function getConversionRate(uint _ethAmount) internal view returns(uint256){
        uint ethPrice = getPrice();
        uint ethAmountInUSD = _ethAmount * ethPrice / 1e18;
        return ethAmountInUSD;

    }
    
    
    function getVersion() internal view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}