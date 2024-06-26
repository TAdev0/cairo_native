#[starknet::contract]
mod U64Sqrt {
    #[storage]
    struct Storage {}

    use integer::u64_sqrt;
    use core::traits::Into;
    use traits::TryInto;
    use option::OptionTrait;


    #[external(v0)]
    fn sqrt(self: @ContractState, num: felt252) -> felt252 {
        let num_in_u64: u64 = num.try_into().unwrap();
        let a: u32 = u64_sqrt(num_in_u64);
        let to_return: felt252 = a.into();
        to_return
    }
}
