//SPDX-License-Identifier:MIT  
pragma solidity ^0.8.2; //This is the solidity version

contract mySimpleStorage{
   uint256  myfavoriteNumber; //default value for uint256 is 0

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    mapping(string => uint256)public nameToFavoriteNumber;

   function store(uint256 _favNum) public virtual{
        myfavoriteNumber = _favNum; 
   }

   function retrieve() public view returns(uint256){
    return myfavoriteNumber;
   }

   function addPerson(string memory name, uint256 _favNumb) public {
    listOfPeople.push(Person(_favNumb, name));
    nameToFavoriteNumber[name] = _favNumb;
   }

   


}
