
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

struct Item {
    uint32 id;
    string name;
    uint64 count;
    uint32 timestamp;
    bool isBought;
    uint256 price;
}

struct ItemsSummary {
    uint256 boughtCount;
    uint256 notBoughtCount;
    uint256 totalPrice;
}
