
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObjectInterface.sol";


contract GameObject is GameObjectInterface {

    int defence;
    int health = 4;


    function resolveAttack(int damage) override external {
        tvm.accept();

        address attacker = msg.sender;
        if (getDefence() - damage < 0) {
            health = health - (damage - getDefence());
            checkIfDead(attacker);
        }
    }

    function getDefence() public view returns (int) {
        tvm.accept();
        return defence;
    }

    function checkIfDead(address attacker) private {
        tvm.accept();
        if (health <= 0) {
            resolveDeath(attacker);
        }
    }

    function resolveDeath(address attacker) virtual internal {
        tvm.accept();
        sendTransactionAllAndDestroy(attacker);
    }

    function sendTransactionAllAndDestroy(address attacker) internal {
        tvm.accept();
        attacker.transfer(0, false, 160);
    }

    function getInfo() public returns (int[]) {
        tvm.accept();
        return [health, address(this).balance];
    }
}
