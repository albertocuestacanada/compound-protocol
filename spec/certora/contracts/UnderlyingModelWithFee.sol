pragma solidity ^0.6.0;

import "../../../contracts/EIP20NonStandardInterface.sol";

import "./SimulationInterface.sol";

contract UnderlyingModelWithFee is EIP20NonStandardInterface, SimulationInterface {
    uint256 _totalSupply;
    uint256 fee;
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowances;

    function totalSupply() public virtual view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address owner) public virtual view returns (uint256 balance) {
        balance = balances[owner];
    }

    function transfer(address dst, uint256 amount) public {
        address src = msg.sender;
        uint256 actualAmount = amount + fee;
        require(actualAmount >= amount);
        require(balances[src] >= actualAmount);
        require(balances[dst] + actualAmount >= balances[dst]);

        balances[src] -= actualAmount;
        balances[dst] += actualAmount;
    }

    function transferFrom(address src, address dst, uint256 amount) public {
        uint256 actualAmount = amount + fee;
        require(actualAmount > fee)
        require(allowances[src][msg.sender] >= actualAmount);
        require(balances[src] >= actualAmount);
        require(balances[dst] + actualAmount >= balances[dst]);

        allowances[src][msg.sender] -= actualAmount;
        balances[src] -= actualAmount;
        balances[dst] += actualAmount;
    }

    function approve(address spender, uint256 amount) public virtual returns (bool success) {
        allowances[msg.sender][spender] = amount;
    }

    function allowance(address owner, address spender) public virtual view returns (uint256 remaining) {
        remaining = allowances[owner][spender];
    }

    function dummy() public {
        return;
    }
}