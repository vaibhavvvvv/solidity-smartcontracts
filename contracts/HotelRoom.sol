// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    address payable public owner;
    enum Statuses { Vacant, Occupied }
    Statuses public currentStatus;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier isOnlyVacant {
        require(currentStatus ==  Statuses.Vacant, "Room already Occupied");
        _;
    }

    modifier minCostOK(uint _amount) {
        require(msg.value >= _amount, "Not enough ether providied");
        _;
    }

    event Occupy (address _occupant, uint _value);
    

    function book() payable public isOnlyVacant minCostOK(2 ether) {
        currentStatus = Statuses.Occupied;

        // owner.transfer(msg.value);
        (bool sent, bytes memory data ) = owner.call{value : msg.value}("");
        require(true);
        emit Occupy(msg.sender, msg.value);
    }

}