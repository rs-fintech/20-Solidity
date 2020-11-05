pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    
    address payable public employee_one;
    address payable public employee_two;
    address payable public employee_three;
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }
    
    function balance() public view returns(uint) {
        return address(this).balance;
    }
    
    function deposit() public payable {
        require(msg.sender == address(this), "You don't own this account!");
        
        uint amount = msg.value / 3; 
        
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        
        uint leftover = msg.value - amount * 3;
        
        msg.sender.transfer(leftover);
    }
    
    function() external payable {
        deposit();
    }
}