void drawCity() {
  // basically the city is rnadom bc i aint manually drawing 60 rectangles lol
  // so when the game starts we check to see if the city is built
  if (citybuilt == false) {
    int buildx = 0;
    // if not we start from x coord 0 and randomly set a height
    for (int i = 0; i < 60; i++){
      // heres that
      int heightbuild = int(random(10, 50));
      // draws rectangle that will go down to y coord 400
      rect(buildx, 400 - heightbuild, 10, heightbuild);
      // we add the height to an array so we can redraw it
      cityinfo[i] = heightbuild;
      // moves next rectangle 10 pixels over
      buildx += 10;
    }
    // then the city is built so we don't want to regenerate it and give the player a seizure
    citybuilt = true;
  }
  else {
    // next we just loop through the array to rebuild the buildings at the same heights
    int buildx = 0;
    for (int i = 0; i < cityinfo.length; i ++) {
      int heightbuild = cityinfo[i];
      rect(buildx, 400 - heightbuild, 10, heightbuild);
      buildx += 10;
    }
  }

  }
      
