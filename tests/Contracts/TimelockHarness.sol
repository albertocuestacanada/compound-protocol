pragma solidity ^0.6.0;

import "../../contracts/Timelock.sol";

abstract contract Administered {
    function _acceptAdmin() public virtual returns (uint);
}

contract TimelockHarness is Timelock {
    constructor(address admin_, uint delay_)
        Timelock(admin_, delay_) public {
    }

    function harnessSetPendingAdmin(address pendingAdmin_) public {
        pendingAdmin = pendingAdmin_;
    }

    function harnessSetAdmin(address admin_) public {
        admin = admin_;
    }
}

contract TimelockTest is Timelock {
    constructor(address admin_, uint delay_) Timelock(admin_, 2 days) public {
        delay = delay_;
    }

    function harnessSetAdmin(address admin_) public {
        require(msg.sender == admin);
        admin = admin_;
    }

    function harnessAcceptAdmin(Administered administered) public {
        administered._acceptAdmin();
    }
}
