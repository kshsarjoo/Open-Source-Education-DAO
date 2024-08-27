# EducationDAO
### <img src"Screenshot (27).png" width="400"/>
## Vision
EducationDAO is a decentralized autonomous organization (DAO) designed to support open-source educational resources. By leveraging blockchain technology, EducationDAO enables a transparent and democratic process where members can propose and vote on initiatives that advance open education for all.

## Flowchart
```
+-------------------+        +-------------------+
|   DAO Members     | -----> |  Propose Action    |
+-------------------+        +-------------------+
        |                          |
        v                          v
+-------------------+        +-------------------+
|     Vote on       | -----> |   Proposal         |
|     Proposal      |        +-------------------+
+-------------------+                |
        |                             v
        v                  +-------------------+
+-------------------+      |   Execute Action  |
|  Execute Proposal | <----|   if Quorum Met   |
+-------------------+      +-------------------+
```

## Smart Contract
### Contract Address
0x73E764fC48dcb2cBE7899CFC98088d290857a9AB  
Deployed on the Ethereum network, this contract governs the proposal, voting, and execution processes within the EducationDAO.

### Functions
- **addMember(address member)**: Add a new member to the DAO. Only the owner can call this function.
- **removeMember(address member)**: Remove an existing member from the DAO. Only the owner can call this function.
- **createProposal(string description)**: Create a new proposal. Only DAO members can propose.
- **voteOnProposal(uint256 proposalIndex)**: Vote on an active proposal. Each member can vote only once per proposal.
- **executeProposal(uint256 proposalIndex)**: Execute a proposal if it has achieved a majority vote. Only the owner can execute proposals.

## Future Scope
- **Token Integration**: Introducing a native token for voting and rewards.
- **Governance Upgrades**: Transitioning to a fully decentralized governance model where all members can propose and execute actions.
- **Partnerships**: Collaborating with educational institutions and platforms to integrate their resources into the DAO.

## Contact
For more information or inquiries, please reach out to:

**Name**:Ksh Sarjoo Leima Singha
**Email**: kshsarjooleimasingha6@gmail.com 
