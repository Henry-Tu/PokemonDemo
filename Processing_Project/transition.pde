void mode4(){
  imageMode(CENTER);
    image(blue,width/2,height/2);
    imageMode(CORNER);
    fill(255);
    rect(0, height*4/5, width, height/5);
    fill(0);
    text(dialogue, width/20, (height*4/5)+height/20);
}
