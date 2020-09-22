pragma solidity ^0.6.0;

import "../../../contracts/PriceOracle.sol";

contract PriceOracleModel is PriceOracle {
    uint dummy;

    function isPriceOracle() public pure returns (bool) {
        return true;
    }

    function getUnderlyingPrice(CToken cToken) public virtual view returns (uint) {
        return dummy;
    }
}