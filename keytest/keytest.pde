// space between rectangle's x coord
int space = 90;
// the starting  x position of the game board
int x = 35;
// how many boxes do we want
int stop = 7;

// input holds the current input
String input = "";
// choice holds the input when enter is pressed
int choice;

// p1 and p2s points
int p1 = 50;
int p2 = 50;

// holds turn and round state
int turn = 1;
boolean roundover = false;

// gamestate variables
// token's current position
int ind = 3;
// array holds game state w one at current postion
// used to draw token in right box
int[] gamestate = {0, 0, 0, 1, 0, 0, 0};

boolean entered = false;

void setup() {
  size(600, 600);
}

void draw() {
  background(50);
  text("Footsteps", 250, 100);
  
  if (entered == true) {
    text(choice, 50, 200);
  }
      
}

void keyPressed() {
  if (key == '\n' ) {   
    entered = true;
    // set guess to the value of the input
    choice = Integer.valueOf(input);
    // clear string after pressing enter
    input = "";

  } else if (key == '0' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9') {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    entered = false;
    input = input + key; 
  }
}
