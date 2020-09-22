pragma solidity ^0.6.0;

contract ConstBase {
    uint public constant C = 1;

    function c() public pure returns (uint) {
        return 1;
    }

    function ADD(uint a) public virtual view returns (uint) {
        // tells compiler to accept view instead of pure
        if (false) {
            C + now;
        }
        return a + C;
    }

    function add(uint a) public virtual view returns (uint) {
        // tells compiler to accept view instead of pure
        if (false) {
            C + now;
        }
        return a + c();
    }
}

contract ConstSub is ConstBase {
    function c() public pure returns (uint) {
        return 2;
    }
}
