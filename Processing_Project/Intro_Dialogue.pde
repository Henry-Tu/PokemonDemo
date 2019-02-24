void mode1() {//intro dialogue
  //image(lab,0,0);
  background(255);
  fill(255);
  rect(0, height*4/5, width, height/5);
  fill(0);
//if a ispressedafter 0.6 seconds of last text, the text will change
  if (a&&millis()-startTime>600) {
    text++;
    startTime=millis();
  }
  //image of prof. oak
  imageMode(CENTER);
  image (oak, (width/2)+10,(height/2)-30,width/2,height/2);
  imageMode(CORNER);
  //various text to display 
  if (text==0) {
    text("Hello and welcome to the world of Pokemon!", width/20, (height*4/5)+height/20);
  }
  if (text==1) {
    text("Today, you will embark on a new journey.", width/20, (height*4/5)+height/20);
  }
  if (text==2) {
    text("But first, you must choose your partner.", width/20, (height*4/5)+height/20);
  }
  if (text==3) {
    startTime=millis();
    text=0;
    mode++;
  }
}
