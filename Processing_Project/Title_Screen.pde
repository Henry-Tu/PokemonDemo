void mode0() {//title screen
  background(255);
  image(titleScreen, width/8, height/20, width*6/8, height*6/10);
  fill(0, 255, 0);
  text("Demo", 190, 155);
  fill(0);
  text("Controls: Arrow keys z = a  x = b\nPress z or click to continue", width/8, height*7/10);
  if (m || a) {
    startTime=millis();
    mode=1;
  }
}
