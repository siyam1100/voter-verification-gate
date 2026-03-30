# Voter Verification Gate

To prevent malicious actors from manipulating the DAO's "Soft Governance," we must verify that every reaction comes from a stakeholder. This repository provides a secure "Collab.Land" style verification flow.

## The Verification Flow
1. **Command**: A user types `/verify` in Discord.
2. **Signature**: The bot provides a unique, time-sensitive URL where the user signs a message (EIP-712) with their wallet.
3. **Mapping**: The bot saves the `DiscordID -> WalletAddress` link in a secure database.
4. **Role Assignment**: If the user holds >100 tokens, they receive the `@VerifiedVoter` role.
5. **Sentiment Filtering**: The `sentiment-circuit-breaker` now only counts reactions from users with this role.

## Security
* **Non-Custodial**: Users only sign a message; they never provide private keys or move funds.
* **Periodic Re-scan**: A background task re-verifies balances every 24 hours to strip roles from users who sold their tokens.
