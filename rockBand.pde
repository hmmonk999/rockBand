import processing.sound.*;

Drums drum;

// Drum Kit information ---------------------------------
SoundFile bassSound;
SoundFile midTomSound;
SoundFile highTomSound;
SoundFile crashSound;
SoundFile closeHighHat;

int bassDelay = 660;
int bassTime = 0;

//Guitar Information ------------------------------------
PImage guitarBase = new PImage();
SoundFile string1;
SoundFile string2;
SoundFile string3;
SoundFile string4;
SoundFile string5;
SoundFile string6;

//Button Information
boolean button = false;

float x = 225;
float y = 820;
int w = 500;
int h = 100;

void setup() {
// Drum Kit information ---------------------------------
  bassSound = new SoundFile(this, "hall.wav");
  midTomSound = new SoundFile(this, "midTom.wav");
  highTomSound = new SoundFile(this, "highTom.wav");
  crashSound = new SoundFile(this, "crash.mp3");
  closeHighHat = new SoundFile(this, "closedHat.mp3");
  
//Guitar Information ------------------------------------
  string1 = new SoundFile(this, "eleString1.mp3");
  string2 = new SoundFile(this, "eleString2.mp3");
  string3 = new SoundFile(this, "eleString3.mp3");
  string4 = new SoundFile(this, "eleString4.mp3");
  string5 = new SoundFile(this, "eleString5.mp3");
  string6 = new SoundFile(this, "eleString6.mp3");
  
  size(950, 950);
  drum = new Drums();
}

void draw() {
  if (button) { 
    electricGuitar();
    
    fill(175);
    stroke(#000000);
    rect(x,y,w,h);
    
    textSize(50);
    fill(#000000);
    text("Go to Drums", x + 90, y + 70);
    
    textSize(30);
    text("String 1, key: 1", 10, 50);
    text("String 2, key: 2", 10, 90);
     text("String 3, key: 3", 10, 130);
      text("String 4, key: 4", 10, 170);
       text("String 5, key: 5", 10, 210);
        text("String 6, key: 6", 10, 250);
  } 
  
  else {
    drumKit();
    
    fill(175);
    stroke(#000000);
    rect(x,y,w,h);
    
    textSize(50);
    fill(#000000);
    text("Go to Guitar", x + 90, y + 70);
  }
  
}

void drumKit() {
    if (keyPressed) {
    if (key == 'b' || key == 'B') {
      if(millis() - bassTime > bassDelay) {
              bassSound.play();
               bassTime = millis();
            }
          background(255);
          drum.holders();
          drum.bassGrow();
          drum.midTom();
          drum.highTom();
          drum.cymbal();
          drum.highHat();
        }
        
    else if (key == 'j' || key == 'J') {
      if(millis() - bassTime > bassDelay) {
              midTomSound.play();
              bassTime = millis();
            } 
     
      drum.bass();
      drum.highTom();
      drum.midTomHit();
      drum.cymbal();
      drum.highHat();
    }
    
    else if (key == 'f' || key == 'F') {
      if(millis() - bassTime > bassDelay) {
              highTomSound.play();
              bassTime = millis();
            } 
      drum.holders();
      drum.bass();
      drum.midTom();
      drum.highTomHit();
      drum.cymbal();
      drum.highHat();
    }
    
    else if (key == 'u' || key == 'U') {
      if(millis() - bassTime > bassDelay) {
              crashSound.play();
              bassTime = millis();
            } 
      background(255);
      drum.holders();
      drum.bass();
      drum.midTom();
      drum.highTom();
      drum.highHat();
      drum.cymbalCrash();
    }
    
    else if (key == 't' || key == 'T') {
      if(millis() - bassTime > bassDelay) {
              closeHighHat.play();
              bassTime = millis();
            } 
      background(255);
      drum.holders();
      drum.bass();
      drum.midTom();
      drum.highTom();
      drum.cymbal();
      drum.highHatClose();
    }
  
  }
  
  else {
    background(255);
    fill(23, 185, 205);
    drum.holders();
    
    drum.bass();
    drum.midTom();
    drum.highTom();
    drum.cymbal();
    drum.highHat();
  }
}

void electricGuitar() {
  imageMode(CENTER);
  
    background(255);
    guitarBase = loadImage("guitar.png");
    image(guitarBase, width/2, width/2.2);
     
     if (keyPressed) {
        if (key == '1') {
          if(millis() - bassTime > bassDelay) {
              string1.play();
              bassTime = millis();
            } 
            strokeWeight(5);
            stroke(#444444);
            line(665, 170, 305, 675); //string 2
            line(680, 158, 311, 681); //string 3
            line(700, 140, 318, 685); //string 4
            line(717, 130, 326, 690); //string 5
            line(735, 120, 334, 696); //string 6
            
            strokeWeight(7);
            stroke(#ffff00);
            line(650, 180, 300, 670); //string 1
         }
         
         else if (key == '2') {
          if(millis() - bassTime > bassDelay) {
              string2.play();
              bassTime = millis();
            } 
            strokeWeight(5);
            stroke(#444444);
            line(650, 180, 300, 670); //string 1
            
            line(680, 158, 311, 681); //string 3
            line(700, 140, 318, 685); //string 4
            line(717, 130, 326, 690); //string 5
            line(735, 120, 334, 696); //string 6
            
            strokeWeight(7);
            stroke(#ffff00);
            line(665, 170, 305, 675); //string 2
         }
         
        else if (key == '3') {
          if(millis() - bassTime > bassDelay) {
              string3.play();
              bassTime = millis();
            } 
            strokeWeight(5);
            stroke(#444444);
            line(650, 180, 300, 670); //string 1
            line(665, 170, 305, 675); //string 2
            
            line(700, 140, 318, 685); //string 4
            line(717, 130, 326, 690); //string 5
            line(735, 120, 334, 696); //string 6
            
            strokeWeight(7);
            stroke(#ffff00);
            line(680, 158, 311, 681); //string 3
         }
         else if (key == '4') {
          if(millis() - bassTime > bassDelay) {
              string4.play();
              bassTime = millis();
            } 
            strokeWeight(5);
            stroke(#444444);
            line(650, 180, 300, 670); //string 1
            line(665, 170, 305, 675); //string 2
            line(680, 158, 311, 681); //string 3
            
            line(717, 130, 326, 690); //string 5
            line(735, 120, 334, 696); //string 6
            
            strokeWeight(7);
            stroke(#ffff00);
            line(700, 140, 318, 685); //string 4
         }
         
         else if (key == '5') {
          if(millis() - bassTime > bassDelay) {
              string5.play();
              bassTime = millis();
            } 
            strokeWeight(5);
            stroke(#444444);
            line(650, 180, 300, 670); //string 1
            line(665, 170, 305, 675); //string 2
            line(680, 158, 311, 681); //string 3
            line(700, 140, 318, 685); //string 4
            
            line(735, 120, 334, 696); //string 6
            
            strokeWeight(7);
            stroke(#ffff00);
            line(717, 130, 326, 690); //string 5
         }
         else if (key == '6') {
          if(millis() - bassTime > bassDelay) {
              string6.play();
              bassTime = millis();
            } 
            strokeWeight(5);
            stroke(#444444);
            line(650, 180, 300, 670); //string 1
            line(665, 170, 305, 675); //string 2
            line(680, 158, 311, 681); //string 3
            line(700, 140, 318, 685); //string 4
            line(717, 130, 326, 690); //string 5
            
            strokeWeight(7);
            stroke(#ffff00);
            line(735, 120, 334, 696); //string 6
         }
         
         else {
          strokeWeight(5);
          stroke(#444444);
          line(650, 180, 300, 670); //string 1
          line(665, 170, 305, 675); //string 2
          line(680, 158, 311, 681); //string 3
          line(700, 140, 318, 685); //string 4
          line(717, 130, 326, 690); //string 5
          line(735, 120, 334, 696); //string 6
          }
      }
    else {
      strokeWeight(5);
      stroke(#444444);
      line(650, 180, 300, 670); //string 1
      line(665, 170, 305, 675); //string 2
      line(680, 158, 311, 681); //string 3
      line(700, 140, 318, 685); //string 4
      line(717, 130, 326, 690); //string 5
      line(735, 120, 334, 696); //string 6
    }
}

void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = !button;
  }  
}
