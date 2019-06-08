import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import moonlander.library.*;

/**
 * Pannukakkuja
 * 
 * 
 */

PVector location;  // Location of shape
PVector velocity;  // Velocity of shape
PVector gravity;   // Gravity acts at the shape's acceleration

Moonlander moonlander;
//float initTimeScene1=0;

//MILLAN
float yoff = 0;
float xoff = 0.0;
//MILLAN
PImage img;


void setup() {
  moonlander = Moonlander.initWithSoundtrack(this, "nooran_cloudgarden.mp3", 120, 8);
  size(880, 660, P3D);
  noCursor();
  //frameRate(60);
  location = new PVector(440,330);
  velocity = new PVector(0,2.1);
  gravity = new PVector(0,0.2); 
  
  img = loadImage("tytyt.jpeg");

  moonlander.start(); 
}

void draw() {
  moonlander.update();
  background(0); 
  
  int scene = moonlander.getIntValue("scene");
  //double value = moonlander.getValue("");
  //background((int)value);
  
  //MILLAN
  background(127,0,0); //yläosan väri
  fill(255,0,0); // alaosan väri
  beginShape();
  float xoff = 0;
  //Horisontaalisesti määritetty loopilla
  for (float xmuuttuja = 0; xmuuttuja <= width; xmuuttuja ++) 
    {
    //ymuuttuja mäpätty noisen suhteen
    float ymuuttuja = map(noise(xoff, yoff), 0, 1, 200, 300);
    vertex(xmuuttuja, ymuuttuja);
    xoff = xoff + 0.05;
    }
    yoff = yoff + 0.01;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
  //MILLAN
  
  if(scene == 0) { // ALKAA
    drawScene0();
  } else if (scene == 1) { 
    drawScene1();
  } else if (scene == 2) {
    drawScene2();
  } else if (scene == 3) {
    drawScene3();
  } else if (scene == 4) { // EKA VAIHTO
    drawScene4();
  } else if (scene == 5) { // VÄHÄN LISÄÄ EDELLISEEN
    drawScene5();
  } else if (scene == 6) { // KRIISIVAIHE
    drawScene6();
  } else if (scene == 7) { // LISÄÄ KRIISIÄ TAI SELVIYTYMINEN
    drawScene7();
  } else if (scene == 8) { // SELVIYTYMINEN TAI HÄIVYTYSVAIHE
    drawScene8();
  } else if (scene == 9) { // HÄIVYTYSTÄ VIELÄ + MEIDÄN KUVA
    drawScene9();
  } else if (scene == 10) { // TÄSSÄ KOHTAA PITÄÄ JO LOPETELLA
    drawScene10();
  } else if (scene == 11) { // SAMMUU
    background(0);
    super.stop();
    exit();
  }
    //stroke(255, 50);
  //translate(50, 50, 0);
  //rotateX(mouseY * 0.05);
  //rotateY(mouseX * 0.05);
  //fill(mouseX * 2, 0, 160);
  //fill(10);
  //sphereDetail(mouseX / 4);
  //sphereDetail(location.x,location.y);
  //sphere(40);
}

void drawScene0() {
  // Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill(244,143,177);
  ellipse(location.x,location.y,200,200);
}

void drawScene1() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill(255,224,130);
  ellipse(location.x,location.y,200,200);
}

void drawScene2() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill(77,208,225);
  ellipse(location.x,location.y,200,200);
}

void drawScene3() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill(142,36,170);
  ellipse(location.x,location.y,200,200);
}

// MUSIIKKI MUUTTUU TÄSSÄ KOHTAA ***************************************************
void drawScene4() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill(33,33,33);
  ellipse(location.x,location.y,200,200);
}

// MUSIIKKI MUUTTUU TÄSSÄ KOHTAA 2. KERRAN ********************************************
void drawScene5() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill(255,87,34);
  ellipse(location.x,location.y,200,200);
}

// ************************************************************************************
void drawScene6() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill(255,224,130);
  ellipse(location.x,location.y,200,200);
}

// **************************************************************************************
void drawScene7() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill( 238, 238, 238 );
  ellipse(location.x,location.y,200,200);
}

// **************************************************************************************
void drawScene8() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill( 41, 182, 246 );
  ellipse(location.x,location.y,200,200);
}

// ************************************************************************************
void drawScene9() {
    image(img, (width - img.width/6), (height - img.height/6), img.width/6, img.height/6);
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill( 238, 238, 238 );
  ellipse(location.x,location.y,200,200);
}

// IHAN LOPPUHÄIVYTYS ********************************************************************
void drawScene10() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.977; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill(33,33,33);
  ellipse(location.x,location.y,200,200);
  background(20);
}
