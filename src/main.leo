// The 'horsebet' program.
program horsebet2.aleo {

    //record Horse
    record horsy {
        owner: address,
        supply: u64,
    }

    mapping account: address => u64;

    /* Mint */

    // The function `mint_public` issues the specified token amount for the token receiver publicly on the network.
    transition mint_public(public receiver: address, public amount: u64, public supply: u64) -> (address, u64, u64) {
        //deduct amount from supply
        let new_supply: u64 = supply - amount;

        // Mint the tokens publicly by invoking the computation on-chain.
        let mint_token: horsy = horsy {
            owner: receiver,
            supply: new_supply,
        };

        return (receiver, amount, supply) then finalize(self.caller, receiver, amount);
    }

    finalize mint_public(public owner: address, public receiver: address, public amount: u64) {
        //decrement sender (self.caller)
        //let caller_amount: u64 = Mapping::get_or_use(account, owner, 0u64);
        //Mapping::set(account, owner, caller_amount - amount);

        // Increments `account[receiver]` by `amount`.
        // If `account[receiver]` does not exist, it will be created.
        // If `account[receiver] + amount` overflows, `mint_public` is reverted.
        let current_amount: u64 = Mapping::get_or_use(account, receiver, 0u64);
        Mapping::set(account, receiver, current_amount + amount);
    }


    transition bid_public(public receiver: address, public amount: u64) ->  (address, u64)   {

        return (receiver, amount) then finalize(receiver, amount);
    }
    finalize bid_public(public receiver: address, public amount: u64) {
        // Decrements `account[receiver]` by `amount`.
        let current_amount: u64 = Mapping::get_or_use(account, receiver, 0u64);
        Mapping::set(account, receiver, current_amount - amount);
    }


    transition reward(public receiver: address, public amount: u64) -> (address, u64)  {

        return (receiver, amount) then finalize(receiver, amount);
    }
    finalize reward (public receiver: address, public amount: u64) {
        // Decrements `account[receiver]` by `amount`.
        let current_amount: u64 = Mapping::get_or_use(account, receiver, 0u64);
        Mapping::set(account, receiver, current_amount + amount);
    }
}
