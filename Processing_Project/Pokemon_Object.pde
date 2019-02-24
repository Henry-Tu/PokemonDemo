class Pokemon {
  String itName;
  int itLevel;
  int itHp;
  int fullHp;
  int itAttack;
  int itDefence;
  int itSpeed;
  String itMove1;
  String itMove1Type;
  int itMove1Power;
  int itMove1PP;
  String itMove2;
  String itMove2Type;
  String itMove2Target;
  String itMove2Stat;
  int itMove2Power;
  int itMove2PP;
  int itAttackStage;
  int itDefenceStage;
  float itAttackMod;
  float itDefenceMod;
  float actualAttack;
  float actualDefence;
  PImage itSprite;


//CONSTRUCTOR
  Pokemon(int num, int num2) {
    itName= pokemon[num];
    itLevel=level[num];
    itHp=hp[num];
    fullHp=itHp;
    itAttack=attack[num];
    itDefence=defence[num];
    itSpeed=speed[num];
    itMove1=move1[num];
    itMove1Type=move1Type[num];
    itMove1Power=move1Power[num];
    itMove1PP=move1PP[num];
    itMove2=move2[num];
    itMove2Type=move2Type[num];
    itMove2Target=move2Target[num];
    itMove2Stat=move2Stat[num];
    itMove2Power=move2Power[num];
    itMove2PP=move2PP[num];
    itAttackStage=attackStage[num];
    itDefenceStage=defenceStage[num];
    itAttackMod=1;
    itDefenceMod=1;
    actualAttack=itAttack*itAttackMod;
    actualDefence=itDefence*itDefenceMod;
    if (num2==1) {
      itSprite=sprite[num] ;
    }
    else {
      itSprite=sprite[num+3];
    }
  }
  void show(int monX, int monY) {
    image(itSprite, monX, monY, width*3/10, height*3/10);
  }
  void attackStat() {
    if ( itAttackStage==0) {
      itAttackMod =1;
      actualAttack=itAttack*itAttackMod;
    }
    if (itAttackStage==-1) {
      itAttackMod =0.66;
      actualAttack=itAttack*itAttackMod;
    }
    if (itAttackStage==-2) {
      itAttackMod =0.5;
      actualAttack=itAttack*itAttackMod;
    }
    if (itAttackStage==-3) {
      itAttackMod =0.4;
      actualAttack=itAttack*itAttackMod;
    }
    if (itAttackStage==-4) {
      itAttackMod =0.33;
      actualAttack=itAttack*itAttackMod;
    }
    if (itAttackStage==-5) {
      itAttackMod =0.28;
      actualAttack=itAttack*itAttackMod;
    }
    if (itAttackStage==-6) {
      itAttackMod =0.25;
      actualAttack=itAttack*itAttackMod;
    }
  }
  void defenceStat() {
    if ( itDefenceStage==0) {
      itDefenceMod =1;
      actualDefence=itDefence*itDefenceMod;
    }
    if (itDefenceStage==-1) {
      itDefenceMod =0.66;
      actualDefence=itDefence*itDefenceMod;
    }
    if (itDefenceStage==-2) {
      itDefenceMod =0.5;
      actualDefence=itDefence*itDefenceMod;
    }
    if (itDefenceStage==-3) {
      itDefenceMod =0.4;
      actualDefence=itDefence*itDefenceMod;
    }
    if (itDefenceStage==-4) {
      itDefenceMod =0.33;
      actualDefence=itDefence*itDefenceMod;
    }
    if (itDefenceStage==-5) {
      itDefenceMod =0.28;
      actualDefence=itDefence*itDefenceMod;
    }
    if (itDefenceStage==-6) {
      itDefenceMod =0.25;
      actualDefence=itDefence*itDefenceMod;
    }
  }
}
