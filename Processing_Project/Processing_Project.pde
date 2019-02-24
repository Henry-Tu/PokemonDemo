/*
Henry Tu
 February 13 2018
 Pokemon Red/Blue demo
 controls:
 menu movement: arrow keys
 a button: key z
 b button: key x
 end game: win the battle against your rival
 if statements plentiful throughout
 for loop: in file reader & in tab battle setup to create transition screen
 user defined function: plentiful throughout
 arrays: appart of object
 user defined object: class Pokemon in "Pokemon_Object" tab
 razzle dazzle: user interface, gaphical assets
 
 
 In Progress:
 
 */
BufferedReader reader;
//declare two objects as new pokemon
Pokemon myMon;
Pokemon rivalMon;
boolean one=true;
//variables to read from a file
String[] pokemon=new String[3];//name of pokemon
int[] level= new int [3];//level of pokemon
int[] hp= new int[3];//hp 
int[] attack = new int [3];//attack stat
int[] defence = new int[3];//defence stat
int[] speed= new int[3];//speed stat
String[] move1=new String[3];//name of first move
String[] move1Type= new String[3];//type of move
int[] move1Power= new int[3];//power of first move
int[] move1PP= new int[3];//pp of first move
String[] move2= new String[3];
String[] move2Type= new String[3];
String[] move2Target= new String[3];
String[] move2Stat=new String[3];
int[] move2Power= new int[3];
int[] move2PP= new int[3];
int[] attackStage=new int[3];
int[] defenceStage=new int[3];

//images to load in
PImage[] sprite;
PImage myMoster;
PImage rivalMonster;
PImage titleScreen;
PImage bulbasaur;
PImage charmander;
PImage squirtle;
PImage bulbasaurBack;
PImage charmanderBack;
PImage squirtleBack;
PImage oak;
PImage lab;
PImage blue;
PImage ball;
int num;
//varable for buttons
boolean a=false, b=false, left=false, right=false, up=false, down=false, m=false;
//game state
int mode=0;
int text=0;
int startTime;
int cursor=0;
boolean chosen=false;
boolean[] alpha=new boolean[4];
boolean menu=true;
int textTime=0;
boolean movNum;
boolean yourTurn=true;
float damage=0;
boolean introDia=true;
String dialogue="You are challenged by rival Blue";
boolean moveTxt=false;


void setup() {
  size(400, 400);
  //file reader
  reader=createReader("monsters.txt");
  sprite = new PImage[6];
  text("", 0, 0);
  //load in images
  titleScreen=loadImage("title.png");
  bulbasaur= loadImage("bulbasaur.png");
  charmander= loadImage("charmander.png");
  squirtle= loadImage("squirtle.png");
  bulbasaurBack=loadImage("bulbasaur-back.png");
  charmanderBack=loadImage("charmander-back.png");
  squirtleBack=loadImage("squirtle-back.png");
  oak=loadImage("oak.png");
  lab=loadImage("lab.jpg");
  blue=loadImage("blue.png");
  ball=loadImage("ball.png");
 //read pokemon data from data file
  try {
    for (int a=0;a<3;a++) {
      pokemon[a]=reader.readLine();
      level[a]=Integer.parseInt(reader.readLine());
      hp[a]=Integer.parseInt(reader.readLine());
      attack[a]=Integer.parseInt(reader.readLine());
      defence[a]=Integer.parseInt(reader.readLine());
      speed[a]=Integer.parseInt(reader.readLine());
      move1[a]=reader.readLine();
      move1Type[a]=reader.readLine();
      move1Power[a]=Integer.parseInt(reader.readLine());
      move1PP[a]=Integer.parseInt(reader.readLine());
      move2[a]=reader.readLine();
      move2Type[a]=reader.readLine();
      move2Target[a]=reader.readLine();
      move2Stat[a]=reader.readLine();
      move2Power[a]=Integer.parseInt(reader.readLine());
      move2PP[a]=Integer.parseInt(reader.readLine());
      attackStage[a]=Integer.parseInt(reader.readLine());
      defenceStage[a]=Integer.parseInt(reader.readLine());
    }
  }
  catch(IOException e) {
    e.printStackTrace();
  }
  //declare sprites for each pokemon
  sprite[0]=bulbasaur;
  sprite[1]=charmander;
  sprite[2]=squirtle;
  sprite[3]=bulbasaurBack;
  sprite[4]=charmanderBack;
  sprite[5]=squirtleBack;
}

void draw() {
  if (mode==0) {
    mode0();
  }
  if (mode==1) {
    mode1();
  }
  if (mode==2) {
    mode2();
  }
  if (mode==3) {
    mode3();
  }
}



boolean pressed;
//code for keyboard controls
void keyPressed() {
  pressed = true;
  if  (key=='z') {
    a=true;
  } 
  if (key=='x') {
    b=true;
  }
  if (keyCode==UP) {
    up=true;
  }
  if (keyCode==DOWN) {
    down=true;
  }
  if (keyCode==LEFT) {
    left=true;
  }
  if (keyCode==RIGHT) {
    right=true;
  }
}
void keyReleased() {
  
  if (key=='z') {
    a=false;
  }
  if (key=='x') {
    b=false;
  }
  if (keyCode==UP) {
    up=false;
  }
  if (keyCode==DOWN) {
    down=false;
  }
  if (keyCode==LEFT) {
    left=false;
  }
  if (keyCode==RIGHT) {
    right=false;
  }
}
//code for mouse controls
void mouseClicked() {
  m=true;
}
void mouseReleased() {
  m=false;
}
