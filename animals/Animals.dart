import 'dart:math';

class Animals
{
  String name;
  int hp;
  int speed;
  int strengh;
  int defence;

  bool isLive = true;

  int atack(Animals enemy) {
    int hitChance = calcHitChance(this.speed, enemy.speed);
    Random rnd = Random();
    int damage = 0;
    if(hitChance >= rnd.nextInt(200)) {
      damage = doDamage(this, enemy, rnd);
    }
    return damage;
  }

  int calcHitChance(int atackerSpeed, int defendingSpeed) {
    return ((atackerSpeed.toDouble() / defendingSpeed.toDouble()) * 100).toInt();
  }

  int doDamage(Animals atacker, Animals defending, Random rnd) {
    int maxDamage = 0;
    maxDamage = defending.defence - atacker.strengh;
    if(maxDamage <= 0) {
      maxDamage = 1;
    }
    int damage = rnd.nextInt(maxDamage);
    defending.hp -= damage;
    if(defending.hp <= 0) {
      defending.hp = 0;
      defending.isLive = false;
    }
    return damage;
  } 

}