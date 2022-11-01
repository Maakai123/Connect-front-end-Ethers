//SPDX License-Identifier: MIT
pragma solidity ^0.8.9;

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//Imports

//To get the right conversion to use
//divide the number u want to fund by current price of eth by  and convert to wei

//50/ 1313 


//State Variable
contract PiggyBank {



    address payable public owner;
uint256 public USD = 10*10**18;


constructor() {
   
    owner == msg.sender;
}

modifier onlyOwner() {
    require(msg.sender == owner, "Not Owner");
    _;
}

function depositFund() public payable {
 require(msg.value >= USD, "add more Eth");


}

function withdrawFund(address _to, uint _amount) external onlyOwner {
    (bool success, ) = _to.call{value: _amount}("");
    require(success, "having issues with transaction at this time");
}



 function destroyContract(address payable _to) external onlyOwner {
     selfdestruct(_to);


 }

function getBalalnce() external view returns(uint256) {
    return address(this).balance;
}

}

  