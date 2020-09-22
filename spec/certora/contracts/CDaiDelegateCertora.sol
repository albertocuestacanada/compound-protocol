pragma solidity ^0.6.0;

import "../../../contracts/CDaiDelegate.sol";

contract CDaiDelegateCertora is CDaiDelegate {
    function getCashOf(address account) public virtual view returns (uint) {
        return EIP20Interface(underlying).balanceOf(account);
    }
}
