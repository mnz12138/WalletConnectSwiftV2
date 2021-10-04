# Wallet Connect v.2 - Swift
Swift implementation of WalletConnect v.2 protocol for native iOS applications.
## Requirements 
- iOS 13
- XCode 13
- Swift 5

## Usage
### Responder
Responder client is usually a wallet.
##### Instantiate Client
```Swift
let url = URL(string: "wss://relay.walletconnect.org")!
let options = WalletClientOptions(apiKey: String, name: String, isController: true, metadata: AppMetadata(name: String?, description: String?, url: String?, icons: [String]?), relayURL: url)
let client = WalletConnectClient(options: options)
```
The `controller` client will always be the "wallet" which is exposing blockchain accounts to a "dapp" and therefore is also in charge of signing.
After instantiation of a client set its delegate.
##### Pair Clients
Pair client with a uri generatet by the `proposer` client.
```Swift
let uri = "wc:..."
try! client.pair(uri: uri)
```
##### Approve Session
Sessions are always proposed by the `Proposer` client so `Responder` client needs either reject or approve a session proposal.
```Swift
class ClientDelegate: WalletConnectClientDelegate {
...
    func didReceive(sessionProposal: SessionType.Proposal) {
        client.approve(proposal: proposal)
    }
...
```
or 
```Swift
    func didReceive(sessionProposal: SessionType.Proposal) {
        client.reject(proposal: proposal, reason: Reason)
    }
```
##### Handle Delegate methods
```Swift
    func didSettle(session: SessionType.Settled) {
        // handle settled session
    }
    func didReceive(sessionProposal: SessionType.Proposal) {
        // handle session proposal
    }
    func didReceive(sessionRequest: SessionRequest) {
        // handle session request
    }
```
##### JSON-RPC Payloads
## Installation
### Swift Package Manager
Add .package(url:_:) to your Package.swift:
```Swift
dependencies: [
    .package(url: "https://github.com/WalletConnect-Labs/WalletConnectSwiftV2", .branch("main")),
],
```
## Example App
## License
