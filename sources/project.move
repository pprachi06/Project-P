module MyModule::PersonalAchievements {

    use aptos_framework::coin;
    use aptos_framework::signer;
    use aptos_framework::aptos_coin::{AptosCoin};

    struct AchievementToken has store, key {
        owner: address,
        achievement_id: u64,
        description: vector<u8>,
    }

    // Function to mint an achievement token
    public fun mint_achievement(owner: &signer, achievement_id: u64, description: vector<u8>) {
        let token = AchievementToken {
            owner: signer::address_of(owner),
            achievement_id,
            description,
        };
        move_to(owner, token);
    }

    // Function to check the token description
    public fun check_achievement(owner: address): (u64, vector<u8>) acquires AchievementToken {
        let token = borrow_global<AchievementToken>(owner);
        (token.achievement_id, token.description)
    }
}
