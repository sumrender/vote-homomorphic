// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract VotingContract {
    address private manager;
    uint256[] private votes;
    uint256 num_votes;
    uint256 n_sq;
    uint256 encrypted_zero;

    uint256 votesSum;

    constructor(uint256 _n_sq, uint256 _zero_encrypted) {
        manager = msg.sender;
        n_sq = _n_sq;
        encrypted_zero = _zero_encrypted;
    }

    function castVote(uint256 vote1, uint256 vote2) external {
        // votes.push(vote);
        // num_votes++;
        votesSum = addEncrypted(vote1, vote2);
    }

    function encryptedSum() external view returns (uint256) {
        // uint256 sum = encrypted_zero;
        // for (uint256 i = 0; i < num_votes; i++) {
        //     sum = addEncrypted(sum, votes[i]);
        // }
        // return sum;

        return votesSum;
    }

    function addEncrypted(
        uint256 a,
        uint256 b
    ) internal view returns (uint256) {
        return a * b % n_sq;
    }
}
