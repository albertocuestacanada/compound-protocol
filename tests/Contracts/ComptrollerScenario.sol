pragma solidity ^0.6.0;

import "../../contracts/Comptroller.sol";

contract ComptrollerScenario is Comptroller {
    uint public blockNumber;

    constructor() Comptroller() public {}

    function fastForward(uint blocks) public virtual returns (uint) {
        blockNumber += blocks;
        return blockNumber;
    }

    function setBlockNumber(uint number) public {
        blockNumber = number;
    }

    function membershipLength(CToken cToken) public virtual view returns (uint) {
        return accountAssets[address(cToken)].length;
    }

    function unlist(CToken cToken) public {
        markets[address(cToken)].isListed = false;
    }
}
