import 'dart:math';

import 'Animals.dart';

class Fight
{
    Animals atacker;
    Animals defending;
    int lastDamage;

    Fight(Animals atacker, Animals defending) {
        this.atacker = atacker;
        this.defending = defending;
    }


    /// [handlerDamage] Callback after each atack. Handler's arguments are (int damage, Animals whoLostHP).
    /// 
    /// Returns 'Animals' winner
    Animals doFight(handlerDamage) {
        bool whoseTurn = (new Random()).nextBool(); //true atacker, false defending
        int damage;
        while (atacker.isLive && defending.isLive) {
            damage = (whoseTurn ? atacker : defending).atack((whoseTurn ? defending : atacker));
            handlerDamage(damage, (whoseTurn ? defending : atacker));
            whoseTurn = !whoseTurn;
        }
        Animals winner = (atacker.isLive ? atacker : defending);
        atacker.isLive = defending.isLive = true;
        atacker.acctualHp = atacker.maxHp;
        defending.acctualHp = defending.maxHp;
        return winner;
    }

}