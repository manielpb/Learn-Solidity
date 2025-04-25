// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {mySimpleStorage} from "./simpleStorage.sol";

contract StorageFactory{

    mySimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
       mySimpleStorage newSimpleStorageContract = new mySimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        mySimpleStorage currentSimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        currentSimpleStorage.store(_newSimpleStorageNumber); 
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
       
        return  listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}