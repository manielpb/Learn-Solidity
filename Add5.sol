// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {mySimpleStorage} from "./simpleStorage.sol";

contract Add5 is mySimpleStorage{
    
    function store(uint256 _favNum) public override {
        myfavoriteNumber = _favNum + 5; 
   }
    
}