pragma solidity ^0.6.0;

import "../../../contracts/Maximillion.sol";

contract MaximillionCertora is Maximillion {
    constructor(CEther cEther_) public Maximillion(cEther_) {}

    function borrowBalance(address account) public virtual returns (uint) {
        return cEther.borrowBalanceCurrent(account);
    }

    function etherBalance(address account) public virtual returns (uint) {
        return account.balance;
    }

    function repayBehalf(address borrower) public payable {
        return super.repayBehalf(borrower);
    }
}