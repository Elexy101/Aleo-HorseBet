# horsebet2.aleo
A simple-test gaming project on Aleo Blockchain using Leo-wallet adapter, Aleo programming language. Player can choose a horse icon and bid a token to begin game. rewards is claimable via the Aleo execute and record is stored privately...

## STEPS TO PLAY
- Make sure to have the Leo wallet extension installed
- Make sure to have enough Leo fee (1000000u64) to claim reward
- to begin game, visit https://biztoken.000webhostapp.com/aleo_monopoly-php/login.php
- Login using this test user account -> user: test1, pass: test1
- Move cursor to profile icon right-left, and click Mint to mint your tokens

![horsebet22](https://github.com/Elexy101/Aleo-HorseBet/assets/24855083/e7dd5914-6df7-41c1-be76-267395c9a322)


- after mint token, test to see if you can sign a message
- then go to left sidebar and click the <strong>TEST GAME</strong> to begin
- After opened, connect wallet and choose default to start game
- if won, try to claim with your wallet

- N/B: I would suggest you create a unique account of yours rather than use test account to avoid non-private stuff leaked...
- Enjoy the test project, more project coming up soon...

## PREVIEW
![horsebet20](https://github.com/Elexy101/Aleo-HorseBet/assets/24855083/e6550f3c-2173-45e8-a837-2bf687c9a39a)

## Requirements
- Leo compiler (can be installed as an extension on VS-code)
- VS Code Editor
- snarkos setup
- leo/aleo setup

## Build Guide


To compile this Aleo program, run:
```bash
leo build
```

To execute this Aleo program, run:
```bash
leo run mint_public
leo run bid_public
leo run reward
```
