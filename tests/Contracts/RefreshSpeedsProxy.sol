pragma solidity ^0.6.0;

abstract contract IComptroller {
	function refreshCompSpeeds() public;
}

contract RefreshSpeedsProxy {
	constructor(address comptroller) public {
		IComptroller(comptroller).refreshCompSpeeds();
	}
}
