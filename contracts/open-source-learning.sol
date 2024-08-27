// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EducationDAO {
    struct Proposal {
        string description;
        uint256 voteCount;
        bool executed;
        address proposer;
    }

    Proposal[] public proposals;
    address public owner;
    mapping(address => bool) public members;
    mapping(uint256 => mapping(address => bool)) public votes;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier onlyMember() {
        require(members[msg.sender], "Not a DAO member");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Add a member to the DAO
    function addMember(address member) public onlyOwner {
        members[member] = true;
    }

    // Remove a member from the DAO
    function removeMember(address member) public onlyOwner {
        members[member] = false;
    }

    // Create a new proposal
    function createProposal(string memory description) public onlyMember {
        proposals.push(Proposal({
            description: description,
            voteCount: 0,
            executed: false,
            proposer: msg.sender
        }));
    }

    // Vote on a proposal
    function voteOnProposal(uint256 proposalIndex) public onlyMember {
        require(proposalIndex < proposals.length, "Invalid proposal");
        require(!votes[proposalIndex][msg.sender], "Already voted");

        proposals[proposalIndex].voteCount += 1;
        votes[proposalIndex][msg.sender] = true;
    }

    // Execute a proposal
    function executeProposal(uint256 proposalIndex) public onlyOwner {
        require(proposalIndex < proposals.length, "Invalid proposal");
        require(!proposals[proposalIndex].executed, "Already executed");

        Proposal storage proposal = proposals[proposalIndex];
        if (proposal.voteCount > (getMemberCount() / 2)) {
            proposal.executed = true;
            // Execute the proposal action
            // In a real DAO, this might trigger funding or another action
        }
    }

    // Get the number of DAO members
    function getMemberCount() public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < proposals.length; i++) {
            if (members[proposals[i].proposer]) {
                count++;
            }
        }
        return count;
    }

    // Get the number of proposals
    function getProposalCount() public view returns (uint256) {
        return proposals.length;
    }
} 
