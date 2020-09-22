pragma solidity ^0.6.0;

import "../../../contracts/CErc20Immutable.sol";
import "../../../contracts/EIP20Interface.sol";

import "./CTokenCollateral.sol";

contract CErc20ImmutableCertora is CErc20Immutable {
    CTokenCollateral public otherToken;

    constructor(address underlying_,
                ComptrollerInterface comptroller_,
                InterestRateModel interestRateModel_,
                uint initialExchangeRateMantissa_,
                string memory name_,
                string memory symbol_,
                uint8 decimals_,
                address payable admin_) public CErc20Immutable(underlying_, comptroller_, interestRateModel_, initialExchangeRateMantissa_, name_, symbol_, decimals_, admin_) {
    }

    function balanceOfInOther(address account) public virtual view returns (uint) {
        return otherToken.balanceOf(account);
    }

    function borrowBalanceStoredInOther(address account) public virtual view returns (uint) {
        return otherToken.borrowBalanceStored(account);
    }

    function exchangeRateStoredInOther() public virtual view returns (uint) {
        return otherToken.exchangeRateStored();
    }

    function getCashInOther() public virtual view returns (uint) {
        return otherToken.getCash();
    }

    function getCashOf(address account) public virtual view returns (uint) {
        return EIP20Interface(underlying).balanceOf(account);
    }

    function getCashOfInOther(address account) public virtual view returns (uint) {
        return otherToken.getCashOf(account);
    }

    function totalSupplyInOther() public virtual view returns (uint) {
        return otherToken.totalSupply();
    }

    function totalBorrowsInOther() public virtual view returns (uint) {
        return otherToken.totalBorrows();
    }

    function totalReservesInOther() public virtual view returns (uint) {
        return otherToken.totalReserves();
    }

    function underlyingInOther() public virtual view returns (address) {
        return otherToken.underlying();
    }

    function mintFreshPub(address minter, uint mintAmount) public virtual returns (uint) {
        (uint error,) = mintFresh(minter, mintAmount);
        return error;
    }

    function redeemFreshPub(address payable redeemer, uint redeemTokens, uint redeemUnderlying) public virtual returns (uint) {
        return redeemFresh(redeemer, redeemTokens, redeemUnderlying);
    }

    function borrowFreshPub(address payable borrower, uint borrowAmount) public virtual returns (uint) {
        return borrowFresh(borrower, borrowAmount);
    }

    function repayBorrowFreshPub(address payer, address borrower, uint repayAmount) public virtual returns (uint) {
        (uint error,) = repayBorrowFresh(payer, borrower, repayAmount);
        return error;
    }

    function liquidateBorrowFreshPub(address liquidator, address borrower, uint repayAmount) public virtual returns (uint) {
        (uint error,) = liquidateBorrowFresh(liquidator, borrower, repayAmount, otherToken);
        return error;
    }
}
