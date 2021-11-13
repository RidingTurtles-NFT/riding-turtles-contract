# Contract Error Codes
## Fusion NFT
- F1 - FusionNft: given rand gen contract is no contract
- F2 - FusionNft: amount must be bigger than 0
- F3 - FusionNft: amount should not exceed 5
- F4 - FusionNft: not enough ether sent
- F5 - FusionNft: levels must be equal
- F6 - FusionNft: owners must be equal
- F7 - FusionNft: nfts not owned by msg sender
- F8 - FusionNft: not enough nfts to mint left
- F9 - FusionNft: not enough nfts to mint left for owner
- F10 - FusionNft: max level reached
- F11 - FusionNft: contract minting and fusioning is paused
- F12 - FusionNft: no more specials to mint
- F13 - FusionNft: no unique traits found

## Randomness
- R1 - NftRandomness: called by other than operator

## Others
- AD2 - Ownable: new owner is the zero address
- AD3 - TokenHolder: ERC20 token address is 0x0
- AD4 - TokenHolder: To address is 0x0
- AD5 - TokenHolder: ERC20 contract address is not a contract
- AM8 - Amount: balance to low
- OT15 - FusionNft: payout failed
- OT16 - TokenHolder: contract cannot approve itself
- OW3 - Ownable: caller is not the owner
- OW4 - Ownable: new owner has to call this function
