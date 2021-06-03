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


/**
 * @title SignedSafeMath
 * @dev Signed math operations with safety checks that revert on error.
 */
library SignedSafeMath {
    int256 constant private _INT256_MIN = -2**255;

        /**
     * @dev Returns the multiplication of two signed integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(int256 a, int256 b) internal pure returns (int256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        require(!(a == -1 && b == _INT256_MIN), "SignedSafeMath: multiplication overflow");

        int256 c = a * b;
        require(c / a == b, "SignedSafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two signed integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(int256 a, int256 b) internal pure returns (int256) {
        require(b != 0, "SignedSafeMath: division by zero");
        require(!(b == -1 && a == _INT256_MIN), "SignedSafeMath: division overflow");

        int256 c = a / b;

        return c;
    }

    /**
     * @dev Returns the subtraction of two signed integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a - b;
        require((b >= 0 && c <= a) || (b < 0 && c > a), "SignedSafeMath: subtraction overflow");

        return c;
    }

    /**
     * @dev Returns the addition of two signed integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a + b;
        require((b >= 0 && c >= a) || (b < 0 && c < a), "SignedSafeMath: addition overflow");

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

// File contracts/libraries/Random.sol

library Random {
    using SafeMath for uint256;
    using SignedSafeMath for int256;

    /**
     * Initialize the pool with the entropy of the blockhashes of the num of blocks starting from 0
     * The argument "seed" allows you to select a different sequence of random numbers for the same block range.
     */
    function init(
        uint256 seed
    ) internal view returns (bytes32[] memory) {
        uint256 blocks = 2;
        bytes32[] memory pool = new bytes32[](3);
        bytes32 salt = keccak256(abi.encodePacked(uint256(0), seed));
        for (uint256 i = 0; i < blocks; i++) {
            // Add some salt to each blockhash
            pool[i + 1] = keccak256(
                abi.encodePacked(blockhash(i), salt)
            );
        }
        return pool;
    }

    /**
     * Advances to the next 256-bit random number in the pool of hash chains.
     */
    function next(bytes32[] memory pool) internal pure returns (uint256) {
        require(pool.length > 1, "Random.next: invalid pool");
        uint256 roundRobinIdx = (uint256(pool[0]) % (pool.length - 1)) + 1;
        bytes32 hash = keccak256(abi.encodePacked(pool[roundRobinIdx]));
        pool[0] = bytes32(uint256(pool[0]) + 1);
        pool[roundRobinIdx] = hash;
        return uint256(hash);
    }

    /**
     * Produces random integer values, uniformly distributed on the closed interval [a, b]
     */
    function uniform(
        bytes32[] memory pool,
        int256 a,
        int256 b
    ) internal pure returns (int256) {
        require(a <= b, "Random.uniform: invalid interval");
        return int256(next(pool) % uint256(b - a + 1)) + a;
    }

    /**
     * Produces random integer values, with weighted distributions for values in a set
     */
    function weighted(
        bytes32[] memory pool,
        uint8[7] memory thresholds,
        uint16 total
    ) internal pure returns (uint8) {
        int256 p = uniform(pool, 1, total);
        int256 s = 0;
        for (uint8 i=0; i<7; i++) {
            s = s.add(thresholds[i]);
            if (p <= s) return i;
        }
    }

    /**
     * Produces random integer values, with weighted distributions for values in a set
     */
    function weighted(
        bytes32[] memory pool,
        uint8[24] memory thresholds,
        uint16 total
    ) internal pure returns (uint8) {
        int256 p = uniform(pool, 1, total);
        int256 s = 0;
        for (uint8 i=0; i<24; i++) {
            s = s.add(thresholds[i]);
            if (p <= s) return i;
        }
    }
}


/**
 * @title Counters
 * @author Matt Condon (@shrugs)
 * @dev Provides counters that can only be incremented or decremented by one. This can be used e.g. to track the number
 * of elements in a mapping, issuing ERC721 ids, or counting request ids.
 *
 * Include with `using Counters for Counters.Counter;`
 * Since it is not possible to overflow a 256 bit integer with increments of one, `increment` can skip the {SafeMath}
 * overflow check, thereby saving gas. This does assume however correct usage, in that the underlying `_value` is never
 * directly accessed.
 */
library Counters {
    using SafeMath for uint256;

    struct Counter {
        // This variable should never be directly accessed by users of the library: interactions must be restricted to
        // the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
        // this feature: see https://github.com/ethereum/solidity/issues/4637
        uint256 _value; // default: 0
    }

    function current(Counter storage counter) internal view returns (uint256) {
        return counter._value;
    }

    function increment(Counter storage counter) internal {
        // The {SafeMath} overflow check can be skipped here, see the comment at the top
        counter._value += 1;
    }

    function decrement(Counter storage counter) internal {
        counter._value = counter._value.sub(1);
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

interface RandomizerInt {
    function returnValue() external view returns (bytes32);
}

interface BuyerWhitelist {
    function isWhitelisted(address _account) external view returns (bool);
}

struct Bid {
    uint256 projectId;
    uint256 amount;
    address bidder;
    uint256 index;
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
  using Counters for Counters.Counter;
  using Random for bytes32[];

  Counters.Counter public _bidIds;
  RandomizerInt entropySource;
  GenArt721CoreContract public artblocksContract;
  BuyerWhitelist public buyerWhitelist;

  // Add the library methods
  using EnumerableSet for EnumerableSet.AddressSet;
  using EnumerableSet for EnumerableSet.UintSet;

  // Declare a set state variable
  EnumerableSet.AddressSet private mySet;

  mapping(uint256 => Bid) public bids;
  mapping(uint256 => Counters.Counter) public projectBids;
  mapping(uint256 => bool) public biddingComplete;
  mapping(uint256 => mapping(address => uint256)) public drawingEntries;
  mapping(uint256 => mapping(address => uint256)) public auctionEntries;
  mapping(address => uint256) public balances;
  mapping(uint256 => uint256) public drawings;
  mapping(uint256 => bool) public projectIdToBonus;
  mapping(uint256 => address) public projectIdToBonusContractAddress;
  mapping(uint256 => bool) public contractFilterProject;
  mapping(uint256 => bool) public projectMintingDisabled;
  mapping(address => mapping (uint256 => uint256)) public projectMintCounter;
  mapping(uint256 => uint256) public projectMintLimit;
  mapping(uint256 => uint256[3]) public projectMintAllocations; // lotto, auction, open

  constructor(address _genArt721Address) {
    artblocksContract=GenArt721CoreContract(_genArt721Address);
  }
  
    modifier onlyWhitelisted {
      require(artblocksContract.isWhitelisted(msg.sender), "can only be set by admin");
      _;
    }
    
    modifier onlyArtist(uint256 _projectId) {
      require(msg.sender==artblocksContract.projectIdToArtistAddress(_projectId), "can only be set by artist");
      _;
    }
    
    // Buyer Whitelist functions
    
    /**
     * @dev set Whitelist
     */
    function setWhitelist(address list) external onlyWhitelisted {
        buyerWhitelist = BuyerWhitelist(list);
    }

    /**
     * @dev check Whitelist
     */
    function checkWhitelist(address _address) external view returns (bool) {
        return buyerWhitelist.isWhitelisted(_address);
    }

    // Randomizer functions

    /**
     * @dev set Randomizer
     */
    function setRandom(address rand) external onlyWhitelisted {
        entropySource = RandomizerInt(rand);
    }

    /**
     * @dev test Randomizer
     */
    function testRandom() external view onlyWhitelisted returns (bytes32) {
        return entropySource.returnValue();
    }

    /**
     * @dev Call the Randomizer and get some randomness
     */
    function getRandomness(uint256 id, uint256 seed)
        internal view returns (uint128 randomnesss)
    {
        uint256 randomness = uint256(keccak256(abi.encodePacked(
            entropySource.returnValue(),
            id,
            seed
        ))); // mix local and Randomizer entropy for randomness
        return uint128(randomness % (2**128)); // cut off half the bits & return
    }

  function getYourBalanceOfProjectERC20(uint256 _projectId) public view returns (uint256){
    uint256 balance = ERC20(artblocksContract.projectIdToCurrencyAddress(_projectId)).balanceOf(msg.sender);
    return balance;
  }

  function checkYourAllowanceOfProjectERC20(uint256 _projectId) public view returns (uint256){
    uint256 remaining = ERC20(artblocksContract.projectIdToCurrencyAddress(_projectId)).allowance(msg.sender, address(this));
    return remaining;
  }
  
  function setProjectMintLimit(uint256 _projectId,uint8 _limit) public onlyWhitelisted {
    projectMintLimit[_projectId] = _limit;
  }

  function setProjectAllocations(uint256 _projectId, uint256[3] memory _allocations) public onlyWhitelisted {
    projectMintAllocations[_projectId] = _allocations;
  }

  function toggleContractFilter(uint256 _projectId) public onlyWhitelisted {
    contractFilterProject[_projectId]=!contractFilterProject[_projectId];
  }

  function toggleDisabled(uint256 _projectId) public onlyWhitelisted {
    projectMintingDisabled[_projectId]=!projectMintingDisabled[_projectId];
  }

  function artistToggleBonus(uint256 _projectId) public onlyArtist(_projectId) {
    projectIdToBonus[_projectId]=!projectIdToBonus[_projectId];
  }

  function artistSetBonusContractAddress(uint256 _projectId, address _bonusContractAddress) public onlyArtist(_projectId) {
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
      _bidIds.increment();
      bidId = _bidIds.current();
      // Check if bid is for the Lottery or Auction
      if (msg.value == price) { // lottery
        buyerWhitelist.isWhitelisted(tx.origin);
        drawingEntries[_projectId][tx.origin] = bidId;
        projectBids[_projectId].increment();
        bids[bidId] = Bid(_projectId, msg.value, tx.origin, projectBids[_projectId].current());
      } else { // Auction
        auctionEntries[_projectId][tx.origin] = bidId;
        bids[bidId] = Bid(_projectId, msg.value, tx.origin, 0);
      }
      // Update users balance
      balances[tx.origin] += msg.value;
  }

  // ERC20 Bid
  function bidERC20(uint256 _projectId, uint256 amount) public returns (uint256 bidId) {
      // is bidding open for this project
      require(!biddingComplete[_projectId], "project minting disabled");
      // is minting enabled
      require(!projectMintingDisabled[_projectId], "project minting disabled");
      // lookup project price
      uint256 price = artblocksContract.projectIdToPricePerTokenInWei(_projectId); // TODO: use ERC20 eqiv
      // Check bid amount is enough
      require(amount >= price, "Bid price to low");
      // Count up bid id
      _bidIds.increment();
      bidId = _bidIds.current();
      // Check if bid is for the Lottery or Auction
      if (amount == price) { // lottery
        buyerWhitelist.isWhitelisted(tx.origin);
        drawingEntries[_projectId][tx.origin] = bidId;
        projectBids[_projectId].increment();
        bids[bidId] = Bid(_projectId, amount, tx.origin, projectBids[_projectId].current());
      } else { // Auction
        auctionEntries[_projectId][tx.origin] = bidId;
        bids[bidId] = Bid(_projectId, amount, tx.origin, 0);
      }
      // TODO: lookup token accepted for this project
      address token;
      // Update users balance of this token
      balancesERC20[token][tx.origin] += amount;
  }
  
  // Increase a bid (auction only)
  function increaseBid(uint256 _bidId) public payable {
    // lookup bid by id
    Bid memory bidLog = bids[_bidId];    
    // ensure bid is an auction bid
    require(bidLog.index == 0,"Not an Auction Bid");
    // ensure bidding is still open
    require(!biddingComplete[bidLog.projectId], "Bidding completed");
    // update bid
    // update auction entry
    // update balance
  }

  // Increase a bid in an ERC20 (auction only)
  function increaseBid(uint256 _bidId, uint256 amount) public {
    // lookup bid by id
    Bid memory bidLog = bids[_bidId];    
    // ensure bid is an auction bid
    require(bidLog.index == 0,"Not an Auction Bid");
    // ensure bidding is still open
    require(!biddingComplete[bidLog.projectId], "Bidding completed");
    // update bid
    // update auction entry
    // update balance
  }

  function lookupTicket(uint256 projectId, address user) return uint256 {
      return drawingEntries[projectId][user];
  }

  function lookupBid(uint256 projectId, address user) return uint256 {
      return auctionEntries[projectId][user];
  }
  
  // Finalize bidding
  function endBidding(uint256 _projectId) public onlyWhitelisted {
    biddingComplete[_projectId] = true;
  }
  
  // Draw Winners
  function drawLotto(uint256 _projectId) public onlyWhitelisted {
      require(biddingComplete[_projectId], "Not completed");
      uint256 result = uint256(entropySource.returnValue());
      drawings[_projectId] = result;
  }
  
  // Check for winner in lottery
  function wonLotto(uint256 _bidId) public view returns (bool) {
      // lookup bid
      Bid memory bidLog = bids[_bidId];
      // make sure bid is a lottery bid
      require(bidLog.index > 0, "Lotto bid IDs only");
      // check project bidding is complete
      require(biddingComplete[bidLog.projectId], "Not completed");
      // create a set to keep tack of drawn tickets
      EnumerableSet.UintSet private winners;
      // Seed a pseudo random number generator with the drawing entropy
      bytes32[] memory pool = Random.init(drawings[bidLog.projectId]);
      // Iterate through number of lottery winners for the project
      for (uint256 i = 0; i < projectMintAllocations[bidLog.projectId][0]; i++) {
          uint256 draw;
          do {
            // draw an index from range 0 to entries - 1
            draw = uint256(pool.uniform(0, int256(projectBids[bidLog.projectId].current().sub(1))));
          } while (winners.contains(draw)) // ensure index was not already drawn
          // save winner to set
          winners.add(draw);
          // If the bids index matches drawn index, then it is a winning bid
          if (draw == bidLog.index) return true;
      }
      // Was not a winner
      return false;
  }
  
  // check for winner in Auction
  function wonAuction(uint256 _bidId) public view returns (bool)  {
      // lookup bid
      // is it 
      return false;
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
  
  // Payout funds from a drop
  function payout(uint256 _projectId) public onlyWhitelisted {
      require(biddingComplete[_projectId], "Not completed");
      // TODO: split payments
  }

  // OLD MINTER FUNCTIONS

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


