pragma solidity ^0.6.0;

contract MathHelpers {

    /*
     * @dev Creates a number like 15e16 as a uint256 from scientific(15, 16).
     */
    function scientific(uint val, uint expTen) pure internal virtual returns (uint) {
        return val * ( 10 ** expTen );
    }

}