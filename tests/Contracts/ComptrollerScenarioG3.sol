pragma solidity ^0.6.0;

import "../../contracts/ComptrollerG3.sol";

contract ComptrollerScenarioG3 is ComptrollerG3 {
    uint public blockNumber;
    address public compAddress;

    constructor() ComptrollerG3() public {}

    function setCompAddress(address compAddress_) public {
        compAddress = compAddress_;
    }

    function getCompAddress() public virtual view returns (address) {
        return compAddress;
    }

    function membershipLength(CToken cToken) public virtual view returns (uint) {
        return accountAssets[address(cToken)].length;
    }

    function fastForward(uint blocks) public virtual returns (uint) {
        blockNumber += blocks;

        return blockNumber;
    }

    function setBlockNumber(uint number) public {
        blockNumber = number;
    }

    function getBlockNumber() public virtual view returns (uint) {
        return blockNumber;
    }

    function getCompMarkets() public virtual view returns (address[] memory) {
        uint m = allMarkets.length;
        uint n = 0;
        for (uint i = 0; i < m; i++) {
            if (markets[address(allMarkets[i])].isComped) {
                n++;
            }
        }

        address[] memory compMarkets = new address[](n);
        uint k = 0;
        for (uint i = 0; i < m; i++) {
            if (markets[address(allMarkets[i])].isComped) {
                compMarkets[k++] = address(allMarkets[i]);
            }
        }
        return compMarkets;
    }

    function unlist(CToken cToken) public {
        markets[address(cToken)].isListed = false;
    }
}
