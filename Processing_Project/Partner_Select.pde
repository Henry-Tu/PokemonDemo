void mode2() {//partner select
  background(255);
  fill(255);
  
  rect(0, height*4/5, width, height/5);
  fill(0);
   imageMode(CENTER);
   fill(255,0,0);
  //pokeballs hiding non selected pokemon
  ellipse(width/6, height/2, 80, 80);
  ellipse(width*3/6, height/2, 80, 80);
  ellipse(width*5/6, height/2, 80, 80);
  fill(0);
   
  if (cursor < 2 && right && millis()-startTime>600&&!chosen) {
    cursor++;
    startTime=millis();
  }
  //if the cursor is on bulbasaur ; display its sprite
  if (cursor>0 && left&& millis()-startTime>600&&!chosen) {
    cursor--;
    startTime=millis();
  }
  if (cursor==0 ) {
    if (!chosen) {
      text("Do you want Bulbasaur, the seed Pokemon?", width/20, (height*4/5)+height/20);
    }
    
    image (bulbasaur, width/6, height/2);
    
  }
  //if the cursor is on charmader; display its sprite
  if (cursor==1) {

    if (!chosen) {
      text("Do you want Charmander, the flame Pokemon?", width/20, (height*4/5)+height/20);
    }
    
    image(charmander, width*3/6, height/2);
    
  }
  //if the cursor is on squirtle ; display its sprite
  if (cursor==2) {
    if (!chosen) {
      text("Do you want Squirtle, the water Pokemon?", width/20, (height*4/5)+height/20);
    }
    
    image (squirtle, width*5/6, height/2);
    fill(0);
  }
 
  imageMode(CORNER);
  //if a is pressed, set chosen as true
  if (a&&millis()-startTime>600&&!chosen) {
    chosen=true; 
    startTime=millis();
  }
  //ask to confirm selection, if confirmed, continue, if not, make chosen false and allow them to chose again
  if (chosen) {

    chosen=true;
    fill(0);
    text("Are you sure you want to chose " + pokemon[cursor] + "?\nYes(a)? \nNo(b)?", width/20, (height*4/5)+height/20);
    
    if (millis()-startTime>600) {
      
      if (b) {
        chosen=false;

        startTime=millis();
      }
      if (a) {

        mode++;
      }
    }
  }
}
