// function to draw gameboard
// input the index of the 1
void board() {
  // set color to sidewalk color
  fill(sidewalk);
  // outlines gross
  noStroke();
  // we want a sidewalk that fills up the whole screen
  // we will draw a parallelogram for each loop
  for (int i = 0; i < 9; i++){
    // draws le parallelogram
    quad(x, 450, x + 70, 450, x + 50, 500, x - 20, 500);
    // checks to see if footprints are there
    if (ind == i) {
      // draws footpritns
      image(img, x + 2, 453);
    }
    // this is the x coordinate of le parrallelogram
    x = x + space;
  }
  // resets x for when the function will get called again
  x = -25;

}
