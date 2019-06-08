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

int karvat = 16000;
Pelo[] lista;
float radio = 0;
float rx = 0;
float ry =0;

Moonlander moonlander;
//float initTimeScene1=0;

//MILLAN
float yoff = 0;
float xoff = 0.0;
//MILLAN
PImage img;


void setup() {
  moonlander = Moonlander.initWithSoundtrack(this, "nooran_cloudgarden.mp3", 120, 8);
  size(1920, 1080, P3D);
  noCursor();
  //frameRate(60);
  location = new PVector(960,540);
  velocity = new PVector(0,2);
  gravity = new PVector(0,1);
  radio = height/6;

  lista = new Pelo[karvat];
  for (int i = 0; i < lista.length; i++) {
    lista[i] = new Pelo();
  }
  noiseDetail(3);
  
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
  } else if (scene == 4) { // EKA VAIHTO -> KARVAPALLO
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

// *****************************************************************************************
void drawScene0() {
  // Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  // Display circle at location vector
  translate(location.x, location.y);
  noStroke();
  fill(244,143,177);
  sphere(radio);
  //ellipse(location.x,location.y,200,200);
}

// *****************************************************************************************
void drawScene1() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  // Display circle at location vector
  translate(location.x, location.y);
  noStroke();
  fill(255,224,130);
  sphere(radio);
  //ellipse(location.x,location.y,200,200);
}

// *****************************************************************************************
void drawScene2() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  // Display circle at location vector
  translate(location.x, location.y);
  noStroke();
  fill(77,208,225);
  sphere(radio);
  //ellipse(location.x,location.y,200,200);
}

// ****************************************************************************************
void drawScene3() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  // Display circle at location vector
  translate(location.x, location.y);
  noStroke();
  fill(77,208,225);
  sphere(radio);
}

// MUSIIKKI MUUTTUU TÄSSÄ KOHTAA - VOILA KARVAPALLO! **************************************
void drawScene4() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }
  
  float rxp = 500;
  float ryp = 500;
  rx = rx*0.9 + rxp*0.1;
  ry = ry*0.9 + ryp*0.1;
  translate(location.x, location.y);
  //translate(width/2, height/2);
  rotateY(rx);
  rotateX(ry);
  fill(0);
  noStroke();
  sphere(radio);

  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar();
  }
}

// MUSIIKKI MUUTTUU TÄSSÄ KOHTAA 2. KERRAN ********************************************
void drawScene5() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  float rxp = 500;
  float ryp = 500;
  rx = rx*0.9 + rxp*0.1;
  ry = ry*0.9 + ryp*0.1;
  translate(location.x, location.y);
  rotateY(rx);
  rotateX(ry);
  fill(0);
  noStroke();
  sphere(radio);

  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar();
  }
}

// ************************************************************************************
void drawScene6() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  // Display circle at location vector
  translate(location.x, location.y);
  noStroke();
  fill(77,208,225);
  sphere(radio);
}

// **************************************************************************************
void drawScene7() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  // Display circle at location vector
  translate(location.x, location.y);
  noStroke();
  fill(77,208,225);
  sphere(radio);
}

// **************************************************************************************
void drawScene8() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  // Display circle at location vector
  translate(location.x, location.y);
  noStroke();
  fill(77,208,225);
  sphere(radio);
}

// ************************************************************************************
void drawScene9() {
    image(img, (width - img.width/6), (height - img.height/6), img.width/6, img.height/6);
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  // Display circle at location vector
  translate(location.x, location.y);
  noStroke();
  fill(77,208,225);
  sphere(radio);
}

// IHAN LOPPUHÄIVYTYS ********************************************************************
void drawScene10() {
// Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  // Display circle at location vector
  noStroke();
  fill(33,33,33);
  ellipse(location.x,location.y,200,200);
  background(20);
}

// ***************************************************************************************
// ********************** KARVAPALLOLUOKKA ***********************************************
class Pelo
{
  float z = random(-radio, radio);
  float phi = random(TWO_PI);
  float largo = random(1.15, 1.2);
  float theta = asin(z/radio);

  Pelo() { // what's wrong with a constructor here
    z = random(-radio, radio);
    phi = random(TWO_PI);
    largo = random(1.15, 1.2);
    theta = asin(z/radio);
  }

  void dibujar() {

    float off = (noise(millis() * 0.0005, sin(phi))-0.5) * 0.3;
    float offb = (noise(millis() * 0.0007, sin(z) * 0.01)-0.5) * 0.3;

    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radio * cos(theta) * cos(phi);
    float y = radio * cos(theta) * sin(phi);
    float z = radio * sin(theta);

    float xo = radio * cos(thetaff) * cos(phff);
    float yo = radio * cos(thetaff) * sin(phff);
    float zo = radio * sin(thetaff);

    float xb = xo * largo;
    float yb = yo * largo;
    float zb = zo * largo;

    strokeWeight(1);
    beginShape(LINES);
    stroke(0);
    vertex(x, y, z);
    stroke(200, 150);
    vertex(xb, yb, zb);
    endShape();
  }
}

class Pelo2 {
  float z = random(-radio, radio);
  float phi = random(TWO_PI);
  float largo = random(1.15, 1.2);
  float theta = asin(z/radio);

  Pelo2() { // what's wrong with a constructor here
    z = random(-radio, radio);
    phi = random(TWO_PI);
    largo = random(1.15, 1.2);
    theta = asin(z/radio);
  }

  void dibujar() {

    float off = (noise(millis() * 0.0005, sin(phi))-0.5) * 0.3;
    float offb = (noise(millis() * 0.0007, sin(z) * 0.01)-0.5) * 0.3;

    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radio * cos(theta) * cos(phi);
    float y = radio * cos(theta) * sin(phi);
    float z = radio * sin(theta);

    float xo = radio * cos(thetaff) * cos(phff);
    float yo = radio * cos(thetaff) * sin(phff);
    float zo = radio * sin(thetaff);

    float xb = xo * largo;
    float yb = yo * largo;
    float zb = zo * largo;

    strokeWeight(3);
    beginShape(LINES);
    stroke(0);
    vertex(x, y, z);
    stroke(200, 150);
    vertex(xb, yb, zb);
    endShape();
  }
}
