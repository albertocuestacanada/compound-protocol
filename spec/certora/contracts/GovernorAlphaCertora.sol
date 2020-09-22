pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "../../../contracts/Governance/GovernorAlpha.sol";

contract GovernorAlphaCertora is GovernorAlpha {
    Proposal proposal;

    constructor(address timelock_, address comp_, address guardian_) GovernorAlpha(timelock_, comp_, guardian_) public {}

    // XXX breaks solver
    /* function certoraPropose() public virtual returns (uint) { */
    /*     return propose(proposal.targets, proposal.values, proposal.signatures, proposal.calldatas, "Motion to do something"); */
    /* } */

    /* function certoraProposalLength(uint proposalId) public virtual returns (uint) { */
    /*     return proposals[proposalId].targets.length; */
    /* } */

    function certoraProposalStart(uint proposalId) public virtual returns (uint) {
        return proposals[proposalId].startBlock;
    }

    function certoraProposalEnd(uint proposalId) public virtual returns (uint) {
        return proposals[proposalId].endBlock;
    }

    function certoraProposalEta(uint proposalId) public virtual returns (uint) {
        return proposals[proposalId].eta;
    }

    function certoraProposalExecuted(uint proposalId) public virtual returns (bool) {
        return proposals[proposalId].executed;
    }

    function certoraProposalState(uint proposalId) public virtual returns (uint) {
        return uint(state(proposalId));
    }

    function certoraProposalVotesFor(uint proposalId) public virtual returns (uint) {
        return proposals[proposalId].forVotes;
    }

    function certoraProposalVotesAgainst(uint proposalId) public virtual returns (uint) {
        return proposals[proposalId].againstVotes;
    }

    function certoraVoterVotes(uint proposalId, address voter) public virtual returns (uint) {
        return proposals[proposalId].receipts[voter].votes;
    }

    function certoraTimelockDelay() public virtual returns (uint) {
        return timelock.delay();
    }

    function certoraTimelockGracePeriod() public virtual returns (uint) {
        return timelock.GRACE_PERIOD();
    }
}
