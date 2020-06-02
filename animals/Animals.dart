import 'dart:math';

class Animals
{
  String name;
  int acctualHp;
  int maxHp;
  int speed;
  int strengh;
  int defence;
  bool isLive = true;

  Animals create(String name, int maxHp, int speed, int strengh, int defence) {
    Animals animal = new Animals();
    animal.name = name;
    animal.maxHp = animal.acctualHp = maxHp;
    animal.speed = speed;
    animal.strengh = strengh;
    animal.defence = defence;
    return animal;
  }

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
    maxDamage = atacker.strengh - defending.defence;
    if(maxDamage <= 0) {
      maxDamage = 1;
    }
    
    int damage = rnd.nextInt(maxDamage+1);
    defending.acctualHp -= damage;
    if(defending.acctualHp <= 0) {
      defending.acctualHp = 0;
      defending.isLive = false;
    }
    return damage;
  } 

}