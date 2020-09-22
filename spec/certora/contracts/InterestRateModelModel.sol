pragma solidity ^0.6.0;

import "../../../contracts/Exponential.sol";
import "../../../contracts/InterestRateModel.sol";

contract InterestRateModelModel is InterestRateModel {
    uint borrowDummy;
    uint supplyDummy;

    function isInterestRateModel() public pure returns (bool) {
        return true;
    }

    function getBorrowRate(uint _cash, uint _borrows, uint _reserves) public virtual view returns (uint) {
        return borrowDummy;
    }

    function getSupplyRate(uint _cash, uint _borrows, uint _reserves, uint _reserveFactorMantissa) public virtual view returns (uint) {
        return supplyDummy;
    }
}
