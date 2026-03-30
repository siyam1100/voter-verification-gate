const { ethers } = require("ethers");

/**
 * Generates the message the user must sign to prove ownership.
 */
function getVerificationMessage(discordId, nonce) {
    return `Verify your DAO identity:\n\nDiscord ID: ${discordId}\nNonce: ${nonce}\n\nThis signature will not cost any gas.`;
}

/**
 * Recovers the address from a signature to verify the link.
 */
function verifySignature(message, signature) {
    const recoveredAddress = ethers.verifyMessage(message, signature);
    return recoveredAddress;
}

module.exports = { getVerificationMessage, verifySignature };
