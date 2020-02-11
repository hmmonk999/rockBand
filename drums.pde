class Drums {
  float bassW;
  float bassH;
  
  int delay;
  int pTime;
  int index;
  
  PImage[] mid = new PImage[7];
  PImage[] high = new PImage[7];
  
  PImage cym = new PImage();
  float counter;
  
  PImage hatTop = new PImage();
  PImage hatBottom = new PImage();
  float hatCrash;
  
  Drums() {
    bassW = 1;
    bassH = 1;
    
    delay = 78;
    pTime = 0;
    index = 0;
    
    counter = 0.0;
    
    hatCrash = height/6;
  }
  
  void bass() {
    strokeWeight(3);
    stroke(#000000);
    fill(#AB85F0);
    ellipse((width/2), (height/1.5), width/3.5, height/3.5);
    fill(#FFF7E6);
    ellipse((width/2), (height/1.5), width/4, height/4);
  }
  
  void bassGrow() {
    bassW = (height/4) + (bassW + 1.2)%(width/20);
    bassH = (height/3.5) + (bassW + 1.2)%(width/20);
    
    strokeWeight(3);
          stroke(#000000);
          fill(#AB85F0);
          ellipse((width/2), (height/1.5), bassH, bassH);
          fill(#FFF7E6);
          ellipse((width/2), (height/1.5), bassW, bassW);
  }
  
  void midTom() {
    imageMode(CORNER);
    for (int i = 0; i < mid.length; ++i) {
    (mid[i] = loadImage("midTom-0" + (i+1) + ".png")).resize(145, 0);
  }
    
    image(mid[0], width/1.65, height/2.5);
  }
  
  void midTomHit() {
    imageMode(CORNER);
    for (int i = 0; i < mid.length; ++i) {
    (mid[i] = loadImage("midTom-0" + (i+1) + ".png")).resize(145, 0);
    
    if (millis() - pTime > delay) {
            pTime = millis();
            index = (index +1)%mid.length;
            background(255);
            holders();
            bass();
            highTom();
            image(mid[index], width/1.65, height/2.5);
              }
    }
  }
  
    void highTom() {
    imageMode(CORNER);
    for (int i = 0; i < high.length; ++i) {
    (high[i] = loadImage("highTom-0" + (i+1) + ".png")).resize(145, 0);
  }
    
    image(high[0], width/4, height/2.5);
  }
  
  void highTomHit() {
    imageMode(CORNER);
    
    for (int i = 0; i < high.length; ++i) {
    (high[i] = loadImage("highTom-0" + (i+1) + ".png")).resize(145, 0);
    
    if (millis() - pTime > delay) {
            pTime = millis();
            index = (index +1)%high.length;
            background(255);
            holders();
            bass();
            midTom();
            image(high[index], width/4, height/2.5);
              }
    }
  }
  
    void highHat() {
    hatTop = loadImage("highHat-09.png");
    hatBottom = loadImage("highHat-10.png");
    
    image(hatTop, width/30, height/6);
    image(hatBottom, width/30, height/4.7);
  }
  
  void highHatClose() {
    hatTop = loadImage("highHat-09.png");
    hatBottom = loadImage("highHat-10.png");
    
    hatCrash+=1;
    
    if (hatCrash >= height/5.5) {
      hatCrash = height/6;
    }
    
    image(hatTop, width/30, hatCrash);
    image(hatBottom, width/30, height/4.7);
  }
  
  void cymbal() {
    cym = loadImage("cymbal.png");
    
    image(cym, width/1.4, height/6.5);
    cym.resize(120, 0);
  }
  
  void cymbalCrash() {
    cym = loadImage("cymbal.png");
    
    counter--;
    if (counter == -15) {
      counter = 0;
    }
    
     translate(width/1.19, height/4);
     rotate(counter*TWO_PI/360);
     translate(-cym.width/2, -cym.height/2);
     image(cym, 0, 0);
  }
  
  void holders() {
    strokeWeight(12);
    stroke(#B3B3B3);
    fill(#B3B3B3);
    line (width/3.4, height/1.25, width/2.5, height/1.7); //bass left leg
    line (width/1.4, height/1.25, width/1.8, height/1.8); //bass right leg
    
    line (width/1.18 - 6, height/1.35, width/1.3, height/1.2); //cymbal left leg
    line (width/1.09, height/1.2, width/1.18, height/1.35); //cymbal right leg
    
    line (width/6, height/1.35, width/6 - 70, height/1.2); //high hat left leg
    line (width/6 + 64, height/1.2, width/6, height/1.35); //high hat right leg
    
    stroke(#000000);
    strokeWeight(2.5);
    rect(width/1.18 - 6, height/4, 10, 550); //cymbal middle leg
    rect(width/6 - 6, height/4 + 10, 10, 550); //high hat middle leg
    fill(#444444);
    rect(width/3.5, height/1.25 - 5, 16, 20, 2); //cymbal middle rubber
    rect(width/1.4 - 10, height/1.25 - 5, 16, 20, 2); //cymbal middle rubber
    
    rect(width/1.18 - 8, height/1.22, 16, 20, 2); //cymbal middle rubber
    rect(width/6 - 8, height/1.22, 16, 20, 2); //high hat middle rubber
    
    rect(width/1.18 + 54, height/1.22, 16, 20, 2); //cymbal left rubber
    rect(width/1.18 - 78, height/1.22, 16, 20, 2); //cymbal left rubber
    
    rect(width/6 + 51, height/1.22, 16, 20, 2); //high hat right rubber
    rect(width/6 - 74, height/1.22, 16, 20, 2); //high hat right rubber
    
    stroke(2.75);
    fill(#B3B3B3);
    //connectors from the bass drum to both tom drums
    rect(width/2 - 25, height/2 - 40, 10, 50);
    rect(width/2 + 20, height/2 - 40, 10, 50);
    rect(width/2 - 45, height/2 + 5, 90, 40, 10);
    rect(width/2 - 25, height/2 - 40, -83, 10);
    rect(width/2 + 20, height/2 - 40, 87, 10);
    ellipse(width/2 + 25, height/2 - 35, 20, 20);
    ellipse(width/2 - 20, height/2 - 35, 20, 20);
    
    textSize(50);
    fill(#000000);
    text("T", 140, 180); 
    text("U", 785, 180); 
    text("F", 300, 350);
    text("J", 650, 350);
    text("B", width/2 - 15, 420);
  }
  
}
