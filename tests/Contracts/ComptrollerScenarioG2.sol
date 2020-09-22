pragma solidity ^0.6.0;

import "../../contracts/ComptrollerG2.sol";

contract ComptrollerScenarioG2 is ComptrollerG2 {
    uint public blockNumber;

    constructor() ComptrollerG2() public {}

    function fastForward(uint blocks) public virtual returns (uint) {
        blockNumber += blocks;
        return blockNumber;
    }

    function setBlockNumber(uint number) public {
        blockNumber = number;
    }
}
