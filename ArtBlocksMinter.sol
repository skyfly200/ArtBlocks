// SPDX-License-Identifier: MIT

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/contracts/utils/EnumerableSet.sol";

pragma solidity >=0.6.0 <0.8.0;

/**
 *Submitted for verification at Etherscan.io on 2020-12-20
*/

// File contracts/libs/SafeMath.sol

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }
}



// File contracts/libs/Strings.sol

// File: contracts/Strings.sol

//https://github.com/oraclize/ethereum-api/blob/master/oraclizeAPI_0.5.sol
library Strings {

    function strConcat(string memory _a, string memory _b) internal pure returns (string memory _concatenatedString) {
        return strConcat(_a, _b, "", "", "");
    }

    function strConcat(string memory _a, string memory _b, string memory _c) internal pure returns (string memory _concatenatedString) {
        return strConcat(_a, _b, _c, "", "");
    }

    function strConcat(string memory _a, string memory _b, string memory _c, string memory _d) internal pure returns (string memory _concatenatedString) {
        return strConcat(_a, _b, _c, _d, "");
    }

    function strConcat(string memory _a, string memory _b, string memory _c, string memory _d, string memory _e) internal pure returns (string memory _concatenatedString) {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        uint i = 0;
        for (i = 0; i < _ba.length; i++) {
            babcde[k++] = _ba[i];
        }
        for (i = 0; i < _bb.length; i++) {
            babcde[k++] = _bb[i];
        }
        for (i = 0; i < _bc.length; i++) {
            babcde[k++] = _bc[i];
        }
        for (i = 0; i < _bd.length; i++) {
            babcde[k++] = _bd[i];
        }
        for (i = 0; i < _be.length; i++) {
            babcde[k++] = _be[i];
        }
        return string(babcde);
    }

    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}

// EnumerableMap library

/**
 * @dev Library for managing an enumerable variant of Solidity's
 * https://solidity.readthedocs.io/en/latest/types.html#mapping-types[`mapping`]
 * type.
 *
 * Maps have the following properties:
 *
 * - Entries are added, removed, and checked for existence in constant time
 * (O(1)).
 * - Entries are enumerated in O(n). No guarantees are made on the ordering.
 *
 * ```
 * contract Example {
 *     // Add the library methods
 *     using EnumerableMap for EnumerableMap.UintToAddressMap;
 *
 *     // Declare a set state variable
 *     EnumerableMap.UintToAddressMap private myMap;
 * }
 * ```
 *
 * As of v3.0.0, only maps of type `uint256 -> address` (`UintToAddressMap`) are
 * supported.
 */
library EnumerableMap {
    // To implement this library for multiple types with as little code
    // repetition as possible, we write it in terms of a generic Map type with
    // bytes32 keys and values.
    // The Map implementation uses private functions, and user-facing
    // implementations (such as Uint256ToAddressMap) are just wrappers around
    // the underlying Map.
    // This means that we can only create new EnumerableMaps for types that fit
    // in bytes32.

    struct MapEntry {
        bytes32 _key;
        bytes32 _value;
    }

    struct Map {
        // Storage of map keys and values
        MapEntry[] _entries;

        // Position of the entry defined by a key in the `entries` array, plus 1
        // because index 0 means a key is not in the map.
        mapping (bytes32 => uint256) _indexes;
    }

    /**
     * @dev Adds a key-value pair to a map, or updates the value for an existing
     * key. O(1).
     *
     * Returns true if the key was added to the map, that is if it was not
     * already present.
     */
    function _set(Map storage map, bytes32 key, bytes32 value) private returns (bool) {
        // We read and store the key's index to prevent multiple reads from the same storage slot
        uint256 keyIndex = map._indexes[key];

        if (keyIndex == 0) { // Equivalent to !contains(map, key)
            map._entries.push(MapEntry({ _key: key, _value: value }));
            // The entry is stored at length-1, but we add 1 to all indexes
            // and use 0 as a sentinel value
            map._indexes[key] = map._entries.length;
            return true;
        } else {
            map._entries[keyIndex - 1]._value = value;
            return false;
        }
    }

    /**
     * @dev Removes a key-value pair from a map. O(1).
     *
     * Returns true if the key was removed from the map, that is if it was present.
     */
    function _remove(Map storage map, bytes32 key) private returns (bool) {
        // We read and store the key's index to prevent multiple reads from the same storage slot
        uint256 keyIndex = map._indexes[key];

        if (keyIndex != 0) { // Equivalent to contains(map, key)
            // To delete a key-value pair from the _entries array in O(1), we swap the entry to delete with the last one
            // in the array, and then remove the last entry (sometimes called as 'swap and pop').
            // This modifies the order of the array, as noted in {at}.

            uint256 toDeleteIndex = keyIndex - 1;
            uint256 lastIndex = map._entries.length - 1;

            // When the entry to delete is the last one, the swap operation is unnecessary. However, since this occurs
            // so rarely, we still do the swap anyway to avoid the gas cost of adding an 'if' statement.

            MapEntry storage lastEntry = map._entries[lastIndex];

            // Move the last entry to the index where the entry to delete is
            map._entries[toDeleteIndex] = lastEntry;
            // Update the index for the moved entry
            map._indexes[lastEntry._key] = toDeleteIndex + 1; // All indexes are 1-based

            // Delete the slot where the moved entry was stored
            map._entries.pop();

            // Delete the index for the deleted slot
            delete map._indexes[key];

            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Returns true if the key is in the map. O(1).
     */
    function _contains(Map storage map, bytes32 key) private view returns (bool) {
        return map._indexes[key] != 0;
    }

    /**
     * @dev Returns the number of key-value pairs in the map. O(1).
     */
    function _length(Map storage map) private view returns (uint256) {
        return map._entries.length;
    }

   /**
    * @dev Returns the key-value pair stored at position `index` in the map. O(1).
    *
    * Note that there are no guarantees on the ordering of entries inside the
    * array, and it may change when more entries are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function _at(Map storage map, uint256 index) private view returns (bytes32, bytes32) {
        require(map._entries.length > index, "EnumerableMap: index out of bounds");

        MapEntry storage entry = map._entries[index];
        return (entry._key, entry._value);
    }

    /**
     * @dev Returns the value associated with `key`.  O(1).
     *
     * Requirements:
     *
     * - `key` must be in the map.
     */
    function _get(Map storage map, bytes32 key) private view returns (bytes32) {
        return _get(map, key, "EnumerableMap: nonexistent key");
    }

    /**
     * @dev Same as {_get}, with a custom error message when `key` is not in the map.
     */
    function _get(Map storage map, bytes32 key, string memory errorMessage) private view returns (bytes32) {
        uint256 keyIndex = map._indexes[key];
        require(keyIndex != 0, errorMessage); // Equivalent to contains(map, key)
        return map._entries[keyIndex - 1]._value; // All indexes are 1-based
    }

    // UintToAddressMap

    struct UintToAddressMap {
        Map _inner;
    }

    /**
     * @dev Adds a key-value pair to a map, or updates the value for an existing
     * key. O(1).
     *
     * Returns true if the key was added to the map, that is if it was not
     * already present.
     */
    function set(UintToAddressMap storage map, uint256 key, address value) internal returns (bool) {
        return _set(map._inner, bytes32(key), bytes32(uint256(value)));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the key was removed from the map, that is if it was present.
     */
    function remove(UintToAddressMap storage map, uint256 key) internal returns (bool) {
        return _remove(map._inner, bytes32(key));
    }

    /**
     * @dev Returns true if the key is in the map. O(1).
     */
    function contains(UintToAddressMap storage map, uint256 key) internal view returns (bool) {
        return _contains(map._inner, bytes32(key));
    }

    /**
     * @dev Returns the number of elements in the map. O(1).
     */
    function length(UintToAddressMap storage map) internal view returns (uint256) {
        return _length(map._inner);
    }

   /**
    * @dev Returns the element stored at position `index` in the set. O(1).
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(UintToAddressMap storage map, uint256 index) internal view returns (uint256, address) {
        (bytes32 key, bytes32 value) = _at(map._inner, index);
        return (uint256(key), address(uint256(value)));
    }

    /**
     * @dev Returns the value associated with `key`.  O(1).
     *
     * Requirements:
     *
     * - `key` must be in the map.
     */
    function get(UintToAddressMap storage map, uint256 key) internal view returns (address) {
        return address(uint256(_get(map._inner, bytes32(key))));
    }

    /**
     * @dev Same as {get}, with a custom error message when `key` is not in the map.
     */
    function get(UintToAddressMap storage map, uint256 key, string memory errorMessage) internal view returns (address) {
        return address(uint256(_get(map._inner, bytes32(key), errorMessage)));
    }
}


// ArtBlocksCore

interface GenArt721CoreContract {
  function isWhitelisted(address sender) external view returns (bool);
  function projectIdToCurrencySymbol(uint256 _projectId) external view returns (string memory);
  function projectIdToCurrencyAddress(uint256 _projectId) external view returns (address);
  function projectIdToArtistAddress(uint256 _projectId) external view returns (address payable);
  function projectIdToPricePerTokenInWei(uint256 _projectId) external view returns (uint256);
  function projectIdToAdditionalPayee(uint256 _projectId) external view returns (address payable);
  function projectIdToAdditionalPayeePercentage(uint256 _projectId) external view returns (uint256);
  function artblocksAddress() external view returns (address payable);
  function artblocksPercentage() external view returns (uint256);
  function mint(address _to, uint256 _projectId, address _by) external returns (uint256 tokenId);
}


interface ERC20 {
  function balanceOf(address _owner) external view returns (uint balance);
  function transferFrom(address _from, address _to, uint _value) external returns (bool success);
  function allowance(address _owner, address _spender) external view returns (uint remaining);
}

interface BonusContract {
  function triggerBonus(address _to) external returns (bool);
  function bonusIsActive() external view returns (bool);
}

// Based on the prior version here:
// https://docs.google.com/document/d/1ZfM745croLc7u_Dt534aH01ye9ePxBoZzOkoC5jJnO4/edit
// Deployed as
// https://etherscan.io/address/aa6ebab3bf3ce561305bd53e4bd3b3945920b176
// Contract improved by Skyler Fly-Wilson
// Started on 3/29/2021
// All additions are MIT OpenSource licensed 

contract GenArt721Minter {
  using SafeMath for uint256;

  GenArt721CoreContract public artblocksContract;

  // Add the library methods
  using EnumerableSet for EnumerableSet.AddressSet;

  // Declare a set state variable
  EnumerableSet.AddressSet private mySet;

  mapping(uint256 => uint256) public bids;
  mapping(uint256 => bool) public biddingComplete;
  mapping(uint256 => mapping(address => bool)) public drawingEntries;
  mapping(uint256 => mapping(address => uint256)) public auctionEntries;
  mapping(address => uint256) public balances;
  mapping(uint256 => uint256) public drawings;
  mapping(uint256 => bool) public projectIdToBonus;
  mapping(uint256 => address) public projectIdToBonusContractAddress;
  mapping(uint256 => bool) public contractFilterProject;
  mapping(uint256 => bool) public projectMintingDisabled;
  mapping(address => mapping (uint256 => uint256)) public projectMintCounter;
  mapping(uint256 => uint256) public projectMintLimit;
  mapping(uint256 => uint256[3]) public projectMintAllocations;

  constructor(address _genArt721Address) {
    artblocksContract=GenArt721CoreContract(_genArt721Address);
  }

  function getYourBalanceOfProjectERC20(uint256 _projectId) public view returns (uint256){
    uint256 balance = ERC20(artblocksContract.projectIdToCurrencyAddress(_projectId)).balanceOf(msg.sender);
    return balance;
  }

  function checkYourAllowanceOfProjectERC20(uint256 _projectId) public view returns (uint256){
    uint256 remaining = ERC20(artblocksContract.projectIdToCurrencyAddress(_projectId)).allowance(msg.sender, address(this));
    return remaining;
  }
  
  function setProjectMintLimit(uint256 _projectId,uint8 _limit) public {
    require(artblocksContract.isWhitelisted(msg.sender), "can only be set by admin");
    projectMintLimit[_projectId] = _limit;
  }

  function setProjectAllocations(uint256 _projectId, uint256[3] memory _allocations) public {
    require(artblocksContract.isWhitelisted(msg.sender), "can only be set by admin");
    projectMintAllocations[_projectId] = _allocations;
  }

  function toggleContractFilter(uint256 _projectId) public {
    require(artblocksContract.isWhitelisted(msg.sender), "can only be set by admin");
    contractFilterProject[_projectId]=!contractFilterProject[_projectId];
  }

  function toggleDisabled(uint256 _projectId) public {
    require(artblocksContract.isWhitelisted(msg.sender), "can only be set by admin");
    projectMintingDisabled[_projectId]=!projectMintingDisabled[_projectId];
  }

  function artistToggleBonus(uint256 _projectId) public {
    require(msg.sender==artblocksContract.projectIdToArtistAddress(_projectId), "can only be set by artist");
    projectIdToBonus[_projectId]=!projectIdToBonus[_projectId];
  }

  function artistSetBonusContractAddress(uint256 _projectId, address _bonusContractAddress) public {
    require(msg.sender==artblocksContract.projectIdToArtistAddress(_projectId), "can only be set by artist");
    projectIdToBonusContractAddress[_projectId]=_bonusContractAddress;
  }

  function bid(uint256 _projectId) public payable returns (uint256 bidId) {
      // is bidding open for this project
      require(!biddingComplete[_projectId], "project minting disabled");
      // is minting enabled
      require(!projectMintingDisabled[_projectId], "project minting disabled");
      // lookup project price
      uint256 price = artblocksContract.projectIdToPricePerTokenInWei(_projectId);
      // Check bid amount is enough
      require(msg.value >= price, "Bid price to low");
      // Log bid
      bidId = 0;
      bids[bidId] = msg.value; // TODO - Also store the address that made the bid
      // is the bid at or over the project price
      if (msg.value == price) { // lottery
        drawingEntries[_projectId][tx.origin] = true;
      } else { // Auction
        auctionEntries[_projectId][tx.origin] = bidId;
      }
      // Update users balance
      balances[tx.origin] += msg.value;
  }
  
  // Increase a bid (auction only)
  function increaseBid(uint256 _bidId) public payable {
    // lookup info of the bid
    // projectId = 0;
    // ensure bid is an auction bid
    // ensure bidding is still open
    // !biddingComplete[projectId]
    // update bid
    // update auction entry
    // update balance
  }
  
  // Finalize bidding
  function endBidding(uint256 _projectId) public { // TODO - Owner only
    biddingComplete[_projectId] = true;
  }
  
  // Draw Winners
  function drawLotto(uint256 _projectId) public { // TODO - Owner only
      uint256 result = 0; // TODO - get a value from the Randomizer contract
      drawings[_projectId] = result;
  }
  
  // Redeem won bids as minted tokens
  function redeem(uint256 _bidId) public {
      // lookup bid
      // deduct bid form balance to pay
      // mark bid as redeemed
      // mint token
  }
  
  // Open Minting
  function mint(uint256 _projectId) payable public {
    // check payment
    // check minting active
    // check tokens are left to mint
    // mint a token
  }
  
  // Withdraw unused funds from lost bids
  function withdraw(uint256 _bidId) public {
      // check caller was the one who placed the bid
      // mark as withdrawn
      // deduct value from address balance
      // send funds to user
  }

  function purchase(uint256 _projectId) public payable returns (uint256 _tokenId) {
    return purchaseTo(msg.sender, _projectId);
  }

  function purchaseTo(address _to, uint256 _projectId) public payable returns(uint256 _tokenId){
    require(!projectMintingDisabled[_projectId], "project minting disabled");
    if (keccak256(abi.encodePacked(artblocksContract.projectIdToCurrencySymbol(_projectId))) != keccak256(abi.encodePacked("ETH"))){
      require(msg.value==0, "this project accepts a different currency and cannot accept ETH");
      require(ERC20(artblocksContract.projectIdToCurrencyAddress(_projectId)).allowance(msg.sender, address(this)) >= artblocksContract.projectIdToPricePerTokenInWei(_projectId), "Insufficient Funds Approved for TX");
      require(ERC20(artblocksContract.projectIdToCurrencyAddress(_projectId)).balanceOf(msg.sender) >= artblocksContract.projectIdToPricePerTokenInWei(_projectId), "Insufficient balance.");
      _splitFundsERC20(_projectId);
    } else {
      require(msg.value>=artblocksContract.projectIdToPricePerTokenInWei(_projectId), "Must send minimum value to mint!");
      _splitFundsETH(_projectId);
    }
    
    // if contract filter is active prevent calls from another contract
    if (contractFilterProject[_projectId]) require(msg.sender == tx.origin, "No Contract Buys");
    
    // limit mints per address by project
    if (projectMintLimit[_projectId] > 0) {
        require(projectMintCounter[msg.sender][_projectId] < projectMintLimit[_projectId], "Reached minting limit");
        projectMintCounter[msg.sender][_projectId]++;
    }

    uint256 tokenId = artblocksContract.mint(_to, _projectId, msg.sender);

    if (projectIdToBonus[_projectId]){
      require(BonusContract(projectIdToBonusContractAddress[_projectId]).bonusIsActive(), "bonus must be active");
      BonusContract(projectIdToBonusContractAddress[_projectId]).triggerBonus(msg.sender);
    }

    return tokenId;
  }

  function _splitFundsETH(uint256 _projectId) internal {
    if (msg.value > 0) {
      uint256 pricePerTokenInWei = artblocksContract.projectIdToPricePerTokenInWei(_projectId);
      uint256 refund = msg.value.sub(artblocksContract.projectIdToPricePerTokenInWei(_projectId));
      if (refund > 0) {
        msg.sender.transfer(refund);
      }
      uint256 foundationAmount = pricePerTokenInWei.div(100).mul(artblocksContract.artblocksPercentage());
      if (foundationAmount > 0) {
        artblocksContract.artblocksAddress().transfer(foundationAmount);
      }
      uint256 projectFunds = pricePerTokenInWei.sub(foundationAmount);
      uint256 additionalPayeeAmount;
      if (artblocksContract.projectIdToAdditionalPayeePercentage(_projectId) > 0) {
        additionalPayeeAmount = projectFunds.div(100).mul(artblocksContract.projectIdToAdditionalPayeePercentage(_projectId));
        if (additionalPayeeAmount > 0) {
          artblocksContract.projectIdToAdditionalPayee(_projectId).transfer(additionalPayeeAmount);
        }
      }
      uint256 creatorFunds = projectFunds.sub(additionalPayeeAmount);
      if (creatorFunds > 0) {
        artblocksContract.projectIdToArtistAddress(_projectId).transfer(creatorFunds);
      }
    }
  }

function _splitFundsERC20(uint256 _projectId) internal {
    uint256 pricePerTokenInWei = artblocksContract.projectIdToPricePerTokenInWei(_projectId);
    uint256 foundationAmount = pricePerTokenInWei.div(100).mul(artblocksContract.artblocksPercentage());
    if (foundationAmount > 0) {
      ERC20(artblocksContract.projectIdToCurrencyAddress(_projectId)).transferFrom(msg.sender, artblocksContract.artblocksAddress(), foundationAmount);
    }
    uint256 projectFunds = pricePerTokenInWei.sub(foundationAmount);
    uint256 additionalPayeeAmount;
    if (artblocksContract.projectIdToAdditionalPayeePercentage(_projectId) > 0) {
      additionalPayeeAmount = projectFunds.div(100).mul(artblocksContract.projectIdToAdditionalPayeePercentage(_projectId));
      if (additionalPayeeAmount > 0) {
        ERC20(artblocksContract.projectIdToCurrencyAddress(_projectId)).transferFrom(msg.sender, artblocksContract.projectIdToAdditionalPayee(_projectId), additionalPayeeAmount);
      }
    }
    uint256 creatorFunds = projectFunds.sub(additionalPayeeAmount);
    if (creatorFunds > 0) {
      ERC20(artblocksContract.projectIdToCurrencyAddress(_projectId)).transferFrom(msg.sender, artblocksContract.projectIdToArtistAddress(_projectId), creatorFunds);
    }
  }

}


