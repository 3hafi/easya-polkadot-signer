EasyA x Polkadot (London)

## Short Summary

SimpleSigner offers a basic on-chain message signing service to help Asset Hub users leave a verifiable public proof-of-interaction using a Solidity smart contract deployed via Polkadot's EVM compatibility layer.

## Full Description

During the EasyA x Polkadot hackathon, I wanted to build a straightforward way for users to leave a public, permanent 'mark' or message on the Polkadot Asset Hub testnet, proving they interacted with a specific contract. While many complex solutions exist, the goal here was a minimal, functional demonstration of deploying custom logic onto Asset Hub.

To solve this, I built `SimpleSigner`, a custom smart contract written in **Solidity**. It provides a core function, `signIn`, which allows any user connected via an EVM-compatible wallet (like MetaMask) to store a short message. This message is publicly stored on the blockchain, linked directly to the sender's wallet address. The contract also keeps a public count (`signerCount`) of the unique addresses that have successfully signed in.

Polkadot technology was essential here. The contract wasn't deployed to a generic EVM chain, but specifically to the **Westmint Asset Hub Testnet**. This deployment leveraged Polkadot's powerful **EVM compatibility layer**, enabled by the **`pallet-revive`** runtime module and executed using the **PolkaVM** engine. This setup allowed standard Solidity code and familiar tools like Remix and MetaMask to interact directly with Polkadot's parachain infrastructure, secured by the Westend Relay Chain, with gas fees paid in testnet WND.

## How it Works

1.  **Connect:** A user connects their MetaMask wallet to the Westmint Asset Hub EVM network (Chain ID `420420421`).
2.  **Interact (e.g., via Remix):** They interact with the deployed `SimpleSigner` contract instance.
3.  **Sign In:** They call the `signIn(string memory message)` function, providing their desired message.
4.  **Storage:** The contract stores the message in a `mapping(address => string) public messages`, associating the message with the caller's address (`msg.sender`).
5.  **Unique Count:** It checks if the address has signed in before (using a private `hasSigned` mapping). If it's a new signer, the public `signerCount` is incremented.
6.  **Event:** A `UserSignedIn` event is emitted, logging the signer's address and message, useful for off-chain applications or indexing.
7.  **View Data:** Anyone can query the contract to:
      * See the message for a specific address using the public `messages` mapping getter (e.g., via Remix or Etherscan-like explorers).
      * See the total number of unique signers using the public `signerCount` variable getter.

## Technical Explanation

  * **Language:** Solidity (v0.8.20)
  * **IDE:** Remix IDE ([remix.polkadot.io](https://remix.polkadot.io/) recommended)
  * **Wallet:** MetaMask
  * **Deployment Target:** Westmint (Westend Asset Hub Testnet - Chain ID `420420421`)

**Polkadot Aspects Used:**

  * **Westmint Parachain:** Deployed directly onto Polkadot's official Asset Hub testnet instance.
  * **`pallet-revive` & EVM Compatibility:** Utilized the crucial FRAME pallet on Westmint that provides the EVM execution environment, enabling Solidity contract deployment and interaction.
  * **PolkaVM:** Contract execution occurred within PolkaVM, Polkadot's high-performance RISC-V based VM.
  * **Ethereum JSON-RPC Endpoint:** Interaction used Westmint's standard EVM-compatible RPC (`https://westend-asset-hub-eth-rpc.polkadot.io`).
  * **WND Token:** Used testnet WND for gas fees via MetaMask.
  * **Parachain Architecture:** Implicitly leveraged the shared security provided by the Westend Relay Chain to the Westmint parachain.

**Unique Polkadot Feature Leveraged:** The core feature demonstrated is **Polkadot's native EVM compatibility deployed directly on a system parachain (Asset Hub)**. This allows developers to use familiar and ubiquitous EVM tooling (Solidity, Remix, MetaMask) to build and deploy on core Polkadot infrastructure, bridging the Ethereum and Polkadot ecosystems effectively via `pallet-revive` and PolkaVM.


## Satisfying Requirement 7 (Custom, Functional Contract)

This submission meets the core coding requirement:

  * It features `SimpleSigner`, a **custom smart contract** written specifically for this hackathon's purpose (not boilerplate).
  * It is deployed and **fully-functioning** on **Polkadot Asset Hub** (specifically, the Westmint testnet instance, utilizing its EVM layer).
  * Functionality is demonstrated in the **Demo Video** linked below, showing successful contract interaction via Remix connected to the Westmint network.

## Demo Video

`[INSERT LINK TO YOUR DEMO VIDEO - e.g., Loom, YouTube]`
*(Make sure this shows Remix connected to Westmint, calling signIn, getMessage, signerCount successfully)*

## Screenshots

`[INSERT 1-2 SCREENSHOTS HERE]`
*(e.g., Screenshot of successful deployment in Remix, Screenshot of calling getMessage/signerCount with results shown)*
*(Upload images to GitHub repo, then use Markdown: )*

## Explanation Video (Loom)

`[INSERT LINK TO YOUR LOOM VIDEO HERE]`
*(This video should show the Solidity code, explain how it works, show the Remix interaction again, explain the deployment to Westmint EVM, and cover the repo structure)*

## GitHub Repo Structure

  * `/contracts/SimpleSigner.sol`: The core Solidity smart contract code developed for this hackathon.
  * `/scripts`, `/tests`, `.prettierrc.json`: Default files potentially included from the Remix IDE workspace environment. They are not essential for the core contract logic itself.
  * `README.md`: This file, explaining the project and submission.

## Deployed Contract Details

  * **Network:** Westmint (Asset Hub Testnet - Chain ID 420420421)
  * **Contract Address:** `[PASTE YOUR DEPLOYED 0x... ADDRESS HERE]`
  * **Explorer Link:** `[PASTE SUBSCAN LINK TO YOUR CONTRACT HERE - Go to https://assethub-westend.subscan.io/, search for your 0x... address, copy the URL of that contract page]`