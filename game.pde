String game() {  
  // check to make sure that p1 and p2 have points before starting their turns 
  // new code makes this redundant fix later
  if (p1 > 0 || p2 > 0 || gameover == true) {
    
    // check for player one's turn
    if (turn == 1) {
      // check to see if enter was pressed and if the value is less than the points the player has
      if (entered == true && choice <= p1) {
        // set entered back to false so if statement doesn't execute again
        entered = false;
        // set choice1 to inputted value
        choice1 = choice;
        // subtract player's expended points from their total
        p1 -= choice1;
        // it's now player 2's turn
        turn = 2;
        
        // basically if a number was too high this gets rid of that message when a valid number has been entered
        return " ";
        }
        // outputs message if value is wrong
        else if (entered == true && choice > p1) {
        // make sure entered is false so it doesn't execute continuously
        entered = false;
        return "Your number is too high.";
      }
      roundover = false;
    }
    
    // same as player 1
    if (turn == 2) {
      if (entered == true && choice <= p2) {
        entered = false;
        choice2 = choice;
        p2 -= choice2;
        
        // we specify that the round is over
        roundover = true;
        
        return " ";
        
      } else if (entered == true && choice > p2) {
        entered = false;
        return "Your number is too high.";
      }
    }
    
    // if both players take their turns we evaluate who won
    if (roundover == true) {
      // first we print out their updated poitns tho
        // print how many points both p1 and p2 have
        disp1 = p1;
        disp2 = p2;

      // if player1 spent more points we display that they won
      if (choice1 > choice2) {
        // we also update the position of the token
        gamestate[ind] = 0;
        // if the index isn't 1 we will move the token closer to the left
        // having it be 0 mkaes it go off screen same for 7 
        if (ind > 1) {
          ind -= 1;
        }
        // the 1 is where the token is
        gamestate[ind] = 1;
        eor = "Player 1 wins this round!";
      }
      
      // same as if player one wins but moves to the right
      else if (choice2 > choice1) {
        gamestate[ind] = 0;
        if (ind < 7) {
          ind += 1;
        }
        gamestate[ind] = 1;
        eor = "Player 2 wins this round!";
        
      // otherwise a tie and nothing moves
      } else if (choice1 == choice2){
        eor = "This round ends in a tie!";
      }
      
      // set choice variables back to 0
      choice1 = 0;
      choice2 = 0;
      
      // set turn back to player 1 if it has points and start round
      if (p1 > 0) {
        turn = 1;
        // otherwise it's player 2's turn
      } else if (p2 > 0) {
        turn = 2;
      // if player 2 has no points than the game is over
      } else if (p1 == 0 && p2 == 0) {
        gameover = true;
      }
      else {
        gameover = true;
      }
      
      // finally return our eor to the user
      roundover = false;
      return eor;
    }
    
    // if the game is over we output a message based on the index of 1 in our gamestate
    if (gameover == true) {
      if (ind > 4) {
        return "Game over: Player 2 wins";
      }
      else if (ind < 4) {
        return "Game over: Player 1 wins";
      } else {
        return"Game over: Tie!";
      }
    }
        
  }
  return "";
}
