void mode5() {
  if (myMon.itHp>0 && rivalMon.itHp> 0) {
    background(255);
    fill(255);
    println( dialogue);
    rect(0, height*4/5, width, height/5);
    rect((width/2)-1, height*4/5, width/2, height/5);

    //Display rival's stats
    rect(0, height/10, width/2, height/6);//box
    fill(0);
    text(rivalMon.itName, 10, (height/10)+20);//name
    text ( "Lvl: " + rivalMon.itLevel, 10, (height/10)+40);//level
    text("HP: " + rivalMon.itHp +" / " + rivalMon.fullHp, 10, (height/10)+60);//hp

    //Display Your stats
    fill(255);
    rect((width/2)-1, height*5/8, width/2, height/6);
    fill(0);
    text(myMon.itName, (width/2)-1, (height*5/8)+20);
    text("Lvl: " + myMon.itLevel, (width/2)-1, (height*5/8)+40);
    text("hP: " + myMon.itHp + " / " +myMon.fullHp, (width/2)-1, (height*5/8)+60);
    text(dialogue, width/20, (height*4/5)+height/20);

    if (moveTxt &&millis()-startTime>2000) {
      dialogue=" ";
      startTime=millis();
      moveTxt=false;
    }


    if (yourTurn) {
      if (menu) {
        menu();
      }
      else if (moveTxt) {
        rect(width/2, height*4/5, width/4, height/10);
        fill(0);
        text("Fight", (width/2)+(width/8)-15, (height*4/5)+(height/10)-15);

        fill(255, 255, 0);
        rect(width/2, height*9/10, width/4, height/10);
        fill(0);
        text("Item", (width/2)+(width/8)-15, (height*9/10)+(height/10)-15);

        fill(0, 255, 0);

        rect(width*3/4, height*4/5, width/4, height/10);
        fill(0);
        text("Pokemon", (width*3/4)+(width/8)-25, (height*4/5)+(height/10)-15);

        fill(0, 0, 255);


        rect(width*3/4, height*9/10, width/4, height/10);
        fill(0);
        text("Run", (width*3/4)+(width/8)-15, (height*9/10)+(height/10)-15);
      }
      else if (!menu && !moveTxt) {
        moves();
      }
    }
    else {
      theirTurn();
    }
    myMon.show( width*1/10, height*10/20);
    rivalMon.show(width*7/10, height*3/20);
  }
  else if (myMon.itHp<0) {
    background(0);
  }
  else if (rivalMon.itHp<0) {
    background(255);
  }
}
void menu() {
  // controls
  if (cursor < 4 && down && millis()-startTime>600) {
    cursor++;
    startTime=millis();
  }
  if (cursor>0 && up&& millis()-startTime>600) {
    cursor--;
    startTime=millis();
  }
  if (cursor < 4 && right && millis()-startTime>600) {
    cursor+=2;
    startTime=millis();
  }
  if (cursor>0 && left&& millis()-startTime>600) {
    cursor-=2;
    startTime=millis();
  }
  //boxes
  for (int r=0;r<4;r++) {
    alpha[r]=false;
  }
  alpha[cursor]=true;
  if (alpha[0]) {
    fill(255, 0, 0);
    //if a is pressed over fight
    if (a && millis()-startTime>600) {
      menu=false;
      startTime=millis();
    }
  }
  else {
    fill(255, 0, 0, 50);
  }
  rect(width/2, height*4/5, width/4, height/10);
  fill(0);
  text("Fight", (width/2)+(width/8)-15, (height*4/5)+(height/10)-15);
  if (alpha[1]) {
    fill(255, 255, 0);
  }
  else {
    fill(255, 255, 0, 50);
  }
  rect(width/2, height*9/10, width/4, height/10);
  fill(0);
  text("Item", (width/2)+(width/8)-15, (height*9/10)+(height/10)-15);
  if (alpha[2]) {
    fill(0, 255, 0);
  }
  else {
    fill(0, 255, 0, 50);
  }
  rect(width*3/4, height*4/5, width/4, height/10);
  fill(0);
  text("Pokemon", (width*3/4)+(width/8)-25, (height*4/5)+(height/10)-15);
  if (alpha[3]) {
    fill(0, 0, 255);
  }
  else {
    fill(0, 0, 255, 50);
  }
  rect(width*3/4, height*9/10, width/4, height/10);
  fill(0);
  text("Run", (width*3/4)+(width/8)-15, (height*9/10)+(height/10)-15);
}
//menu for you moves
void moves() {
  //go back
  if (b&& millis()-startTime>600) {
    menu=true;
    startTime=millis();
    cursor=0;
  }
  //controls
  if (cursor < 2 && right && millis()-startTime>600) {
    cursor++;
    startTime=millis();
  }
  if (cursor>0 && left&& millis()-startTime>600) {
    cursor--;
    startTime=millis();
  }
  //moves menu
  if (cursor==0) {
    fill(200, 200, 200);
    rect(width/2, height*4/5, width/4, height/10);
    fill(0);
    text(myMon.itMove1, (width/2)+(width/8)-15, (height*4/5)+(height/10)-15);
    fill(200, 200, 200, 50);
    rect(width*3/4, height*4/5, width/4, height/10);
    fill(0);
    text(myMon.itMove2, (width*3/4)+(width/8)-25, (height*4/5)+(height/10)-15);
    //if you select move 1
    if (a && millis()-startTime>600 && !moveTxt) {
      damage=((((10/5)+1)*(myMon.itMove1Power)*(myMon.actualAttack)/(rivalMon.actualDefence))/50)+2;
      rivalMon.itHp-=damage;
      damage=0;
      moveTxt=true;
      dialogue= myMon.itName + " used " + myMon.itMove1;
      menu=false;
      yourTurn=false;
      startTime=millis();
    }
  }
  //if you select move 2
  else {
    fill(200, 200, 200, 50);
    rect(width/2, height*4/5, width/4, height/10);
    fill(0);
    text(myMon.itMove1, (width/2)+(width/8)-15, (height*4/5)+(height/10)-15);
    fill(200, 200, 200);
    rect(width*3/4, height*4/5, width/4, height/10);
    fill(0);
    text(myMon.itMove2, (width*3/4)+(width/8)-25, (height*4/5)+(height/10)-15);
    if (a && millis()-startTime>600) {
      if ((myMon.itMove2Stat).equals("attack") && (rivalMon.itAttackStage)>-7) {
        rivalMon.itAttackStage-=1;
        rivalMon.attackStat();
        dialogue= myMon.itName + " used " + myMon.itMove2;
      }
      if (myMon.itMove2Stat.equals("defence") && (rivalMon.itDefenceStage)>-7) {
        rivalMon.itDefenceStage-=1; 
        rivalMon.defenceStat();
        dialogue= myMon.itName + " used " + myMon.itMove1;
      }
      startTime=millis();
      yourTurn=false;
    }
  }
}
// if it is your rival's turn
void theirTurn() {
  if (!moveTxt) {
    int move=(int)random(1);
    if (move==0) {
      damage=((((10/5)+1)*(rivalMon.itMove1Power)*(rivalMon.actualAttack)/(myMon.actualDefence))/50)+2;
      myMon.itHp-=damage;
      damage=0;
      yourTurn=true;
    }
    else {
      if ((rivalMon.itMove2Stat).equals("attack") && (myMon.itAttackStage)>-7) {
        myMon.itAttackStage-=1;
        myMon.attackStat();
      }
      if (rivalMon.itMove2Stat.equals("defence") && (myMon.itDefenceStage)>-7) {
        myMon.itDefenceStage-=1; 
        myMon.defenceStat();
      }
    }
    yourTurn=true;
    menu=true;
  }
}
