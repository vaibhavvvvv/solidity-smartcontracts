// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//inheritance
contract Ownable {
    address owner;

     modifier onlyOwner(){
        require(msg.sender == owner, "must be owner");
        _;
     }

    constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {
 
      string secret;

      constructor(string memory _secret ) {
        secret = _secret;
      }   

       function getSecret() public view returns (string memory){
        return  secret;
      }
}

contract MyContract is Ownable {
//     //state variables
//     uint public myUint = 1;  // default size - 256 bytes
//     uint256 public myUint256 = 1;  //longform of uint
//     int public myInt = -1; //can store negative values as well
//     uint8 public  myUint8 = 1;

//     string public myString = "Hello world. punnu's a noob gamer";  //variable size
//     bytes32 public myBytes32 = "hello world in 32 bytes"; //fixed size of 32 bytes

//     address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

//     struct MyStruct {
//         uint256 myUint256;
//         string myString;
//     } // custom datatype

//     MyStruct public  mystruct = MyStruct(1, "Hello , hii, bye bye");

//    //local variables - cannot be accessed outside the declared function
//    // pure - contents of function cannot be modified
//    function getValue() public pure returns(uint){
//     uint value =1;
//     return value;
//    }


    // //Arrays
    // uint[] public uintArray = [1,2,3];
    // string[] public stringArray = ["hey", "hello", "byee"];
    // string[] public values;
    // uint[][] public array2D = [[1,2,3], [4,5,6]];

    // function addValue (string memory _value) public {
    //     values.push(_value);
    // }

    // function valueCount() public view returns(uint) {
    //     return values.length;
    // }    


    // //Mappings--> can be used to store data on blockchain as key-value pair
    // mapping(uint => string) public names;
    // mapping(uint => Book) public books;
    // mapping(address => mapping(uint => Book) ) public  myBooks;

    // struct Book {
    //     string title;
    //     string author;
    // }

    // constructor() {
    //     names[1] = "vaibhav";
    //     names[2] = "punnudon";
    //     names[3] = "om";
    // }

    // function addBook(uint _id, string memory _title, string memory _author) public {
    //     books[_id] = Book(_title,  _author);
    // }

    // // msg.sender is a global variable(exposed in tranasactions) which contains sender's address
    // function addMyBook(uint _id, string memory _title, string memory _author) public {
    //     myBooks[msg.sender][_id] = Book(_title,  _author);
    // }



    // Conditionals and Loops
     
    // address public owner;
    // uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];

    // constructor(){
    //     owner = msg.sender;
    // }

    // function isOwner() public view returns(bool) {
    //     return (msg.sender == owner);
    // }

    // function countEvenNumbers() public view returns (uint){
    //     uint count =0;
    //     for( uint i =0; i< numbers.length;i++ ){
    //         if(isEvenNumber(numbers[i])){
    //             count++;
    //         }
    //     }
    //     return  count;
    // }

    // function isEvenNumber(uint _number) public view returns(bool){
    //     if( _number % 2 == 0 ){
    //         return true;
    //     } else {
    //         return false;
    //     }
    // }

      address secretVault;

      constructor(string memory _secret )  {
        SecretVault _secretVault =  new SecretVault(_secret);
        secretVault = address(_secretVault);
        super; // calls constructor of parent contract
      }

     function getSecret() public onlyOwner view returns (string memory){
        return  SecretVault(secretVault).getSecret();
      }
     
}