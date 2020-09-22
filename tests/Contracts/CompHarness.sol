pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "../../contracts/Governance/Comp.sol";

contract CompScenario is Comp {
    constructor(address account) Comp(account) public {}

    function transferScenario(address[] memory destinations, uint256 amount) public virtual returns (bool) {
        for (uint i = 0; i < destinations.length; i++) {
            address dst = destinations[i];
            _transferTokens(msg.sender, dst, uint96(amount));
        }
        return true;
    }

    function transferFromScenario(address[] memory froms, uint256 amount) public virtual returns (bool) {
        for (uint i = 0; i < froms.length; i++) {
            address from = froms[i];
            _transferTokens(from, msg.sender, uint96(amount));
        }
        return true;
    }

    function generateCheckpoints(uint count, uint offset) public {
        for (uint i = 1 + offset; i <= count + offset; i++) {
            checkpoints[msg.sender][numCheckpoints[msg.sender]++] = Checkpoint(uint32(i), uint96(i));
        }
    }
}
