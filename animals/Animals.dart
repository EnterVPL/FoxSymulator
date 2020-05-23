import 'dart:math';

class Animals
{
  String name;
  int hp;
  int speed;
  int strengh;
  int defence;

  bool isLive = true;

  int hurt(Animals enemy) {
    int hitChance = ((enemy.speed.toDouble() / this.speed.toDouble()) * 100).toInt();
    Random rnd = Random();
    int lost = 0;
    if(hitChance >= rnd.nextInt(200)) {
      lost = this.defence - enemy.strengh;
      if(lost <= 0) {
        lost = 1;
      }
      lost = rnd.nextInt(lost);
      this.hp -= lost;
      if(this.hp <= 0) {
        this.hp = 0;
        this.isLive = false;
      }
    }
    return lost;
  }


}