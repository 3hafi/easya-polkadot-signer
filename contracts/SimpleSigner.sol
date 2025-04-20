// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; 

contract SimpleSigner {
    // Mapping from address to their message
    mapping(address => string) public messages;
    // Count unique signers
    uint64 public signerCount;
    // Keep track of who has signed to correctly count unique signers
    mapping(address => bool) private hasSigned;

    event UserSignedIn(address indexed account, string message);

    function signIn(string memory message) public {
        address caller = msg.sender;
        // Check if this is their first time signing in
        if (!hasSigned[caller]) {
            signerCount++;
            hasSigned[caller] = true;
        }

        messages[caller] = message;
        emit UserSignedIn(caller, message);
    }

    /// Get the message stored by a specific account.
    // We can call the public mapping directly from Remix/ethers: messages(address)
    function getMessage(address account) public view returns (string memory) {
         return messages[account];
    }

     /// Get the total number of unique signers.
     // You can call the public variable directly: signerCount()
     function getSignerCount() public view returns (uint64) {
         return signerCount;
     }
}