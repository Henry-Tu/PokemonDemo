void mode3() {
  //background(255);
  //sets up you pokemon and you rival, 
  //depending on your selection, you rival will be given the pokemon of opposite type
  if (one) {
    myMon= new Pokemon(cursor, 0);
    if (cursor==0) {
      cursor=1;
    }
    else if (cursor==1) {
      cursor=2;
    }
    else {
      cursor=0 ;
    }
    rivalMon=new Pokemon(cursor, 1);
    cursor=0;
    one=false;
    startTime=millis();
  }
  //display your rival
  if (introDia) {
    if (millis()-startTime<2000) {
      mode4();
    }
    //transition screen
    else if (millis()-startTime<3000) {
      for (int a=0;a<10;a++) {
        for (int b=0;b<8;b++) {
          image(ball, a*width/10, b*height/10, width/10, height/10);
        }
      }
    }
    else if (millis()-startTime<3100) {
      background(0);
    }
    else {
      introDia=false;
    }
  }
  //move on to next mode
  else {
    background(0);
    //dialogue="";
    mode5();
  }
}
