// space between rectangle's x coord
int space = 75;
// the starting  x position of the game board
int x = -25;
// how many boxes do we want
int stop = 7;

// loads in our footprints image
PImage img;
PFont font;

// our grass color
color grass = color(135, 163, 139);
color sidewalk = color(104, 109, 112);
color city = color(45, 48, 51);

// input holds the current input
String input = "";
// choice holds the input when enter is pressed
int choice;
// stores true if input was just entered
boolean entered = false;

// p1 and p2s points
int p1 = 50;
int p2 = 50;
// these are points displayed so u don't know how many the other person put in
int disp1 = 50;
int disp2 = 50;

// stores choices of p1 and p2 every round
int choice1;
int choice2;

// holds turn and round state
int turn = 1;
boolean roundover;

// gamestate variables
// token's current position
int ind = 4;
// array holds game state w one at current postion
// used to draw token in right box
int[] gamestate = {0, 0, 0, 0, 1, 0, 0, 0, 0};

// true if both players are out of points
boolean gameover = false;

// stores end of round results
String eor;

// hold current status of game as string
String status;
String current = "";

// determines if the city has already been drawn yet or not
boolean citybuilt = false;
int[] cityinfo = new int[60];


void setup() {
  size(600, 600);
  
  // load in image
  img = loadImage("footstepsmall.png");
  
  // loads our font
  font = loadFont("font.vlw");
  textFont(font);
}

void draw() {
  // ok so first we set font and background stuff
  textSize(55);
  background(182, 197, 214);
  
  // this literally just prints footprints with the cool footprints
  text("F", 180, 50);
  image(img, 215, 15);
  text("tsteps", 260, 50);
  
  // draws our grass
  fill(grass);
  rect(0, 400, 600, 200);
  
  // draws le board
  board();
  
  // this is the players points
  textSize(30);
  text("Player 1:" + disp1, 30, 150);
  text("Player 2:" + disp2, 380, 150);
  
  // print our city
  drawCity();
  
  // change the color back bc it changes during the city part
  fill(sidewalk);
  
  // next we draw a line (rectangle in hiding) underneath the active player
  if (turn == 1) {
    //text("Player 1: How many points do you want to spend?", 250, 250);
    rect(30, 155, 195, 2);
  }
  else if (turn == 2) {
    //text("Player 2: How many points do you want to spend?", 250, 250);
    rect(380, 155, 195, 2);
  }
  
  // basically the game loop returns a staus that could be the outcome of the game or
  // just the player entering a number that's too large
  status = game();
  
  // if the status hasn't changed the function will return this ""
  // we want our statuses to stay so we don't print those
  // instead we just wait until we have a new status
  if (status != "") {
    current = status;
  }
  // this draws our status on the screen
  textAlign(CENTER);
  text(current, 300, 260);
  textAlign(LEFT);
  
}


void keyPressed() {
  if (key == '\n' ) {  
    // set guess to the value of the input
    if (input != "") {
      
      choice = Integer.valueOf(input);
      
      // clear string after pressing enter
      input = "";
      // set entered to true so program knows key just entered
      entered = true;
    }

  } else if (key == '0' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9') {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    // as soon as a key is hit we set entered to false
    entered = false;
    input = input + key; 
  }
}
