pragma solidity ^0.6.0;

import "../../contracts/PriceOracle.sol";

contract FixedPriceOracle is PriceOracle {
    uint public price;

    constructor(uint _price) public {
        price = _price;
    }

    function getUnderlyingPrice(CToken cToken) public virtual view returns (uint) {
        cToken;
        return price;
    }

    function assetPrices(address asset) public virtual view returns (uint) {
        asset;
        return price;
    }
}
