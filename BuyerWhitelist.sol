// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

interface GenArt721CoreContract {
  function isWhitelisted(address sender) external view returns (bool);
}

contract BuyerWhitelist {
    mapping(address => bool) public whitelisted;
    GenArt721CoreContract public artblocksContract;
    
    constructor(address _genArt721Address) {
        artblocksContract = GenArt721CoreContract(_genArt721Address);
    }
    
    modifier onlyWhitelisted {
      require(artblocksContract.isWhitelisted(msg.sender), "can only be set by admin");
      _;
    }
    
    function addToList(address _account) public onlyWhitelisted {
        whitelisted[_account] = true;
    }
    
    function removeFromList(address _account) public onlyWhitelisted {
        whitelisted[_account] = false;
    }
    
    function isWhitelisted(address _account) external view returns (bool) {
        return whitelisted[_account];
    }
}