import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import moonlander.library.*;

/**
 * Pannukakkuja
 * made by Laura North, Milla Järvi and Noora Heiskanen
 * music "Cloud Garden" & Images by Noora Heiskanen
 * thx David Pena for fur ball inspiration
 */

PVector location;  // Location of shape
PVector velocity;  // Velocity of shape
PVector gravity;   // Gravity acts at the shape's acceleration

int karvat = 6000;
Pelo[] lista;
float radio = 0;
float rx = 0;
float ry =0;

Moonlander moonlander;

float yoff = 0;
float xoff = 0;
PImage lettu;
PImage clouds3;
PImage clouds4;
PImage clouds5;
PImage cloud1;


// **************************** SETUP ****************************************************
void setup() {
  moonlander = Moonlander.initWithSoundtrack(this, "nooran_cloudgarden.mp3", 120, 8);
  size(1920, 1080, P3D);
  noCursor();

  location = new PVector(960,540);
  velocity = new PVector(0,2);
  gravity = new PVector(0,1);

  clouds3 = loadImage("cloudysky03.jpg");
  clouds4 = loadImage("cloudysky04.jpg");
  clouds5 = loadImage("cloudysky05.jpg");
  cloud1 = loadImage("cloud1.jpg");  

  radio = height/6;

  lista = new Pelo[karvat];
  for (int i = 0; i < lista.length; i++) {
    lista[i] = new Pelo();
  }
  
  //noiseDetail(3);
  
  lettu = loadImage("lettu.png");
  

  moonlander.start(); 
}

// ************************************** DRAW ******************************************
void draw() {
  moonlander.update();
  background(0);

  int scene = moonlander.getIntValue("scene");
 
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
}

// **************************************** EKA SKENE *************************************
void drawScene0() {

  background(cloud1);
  fill(209,233,233); // alaosan väri
  beginShape();
  float xoff = 0;
  //Horisontaalisesti määritetty loopilla
  for (float xmuuttuja = 0; xmuuttuja <= width; xmuuttuja ++) 
    {
    //ymuuttuja mäpätty noisen suhteen
    float ymuuttuja = map(noise(xoff, yoff), 0, 1, 200, 800);
    vertex(xmuuttuja, ymuuttuja);
    xoff = xoff + 0.05;
    }
    yoff = yoff + 1;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);

  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  translate(location.x, location.y);
  stroke(255, 50);
  sphereDetail(25);
  fill( 33, 33, 33 );
  rotate(frameCount / 30.0);
  sphere(radio);
}

// ******************************************* SKENE 1 ************************************
void drawScene1() {
  background(cloud1);
  fill(209,233,233); // alaosan väri
  beginShape();
  float xoff = 0;
  //Horisontaalisesti määritetty loopilla
  for (float xmuuttuja = 0; xmuuttuja <= width; xmuuttuja ++) 
    {
    //ymuuttuja mäpätty noisen suhteen
    float ymuuttuja = map(noise(xoff, yoff), 0, 1, 200, 900);
    vertex(xmuuttuja, ymuuttuja);
    xoff = xoff + 0.05;
    }
    yoff = yoff + 0.01;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
    
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

  stroke(255, 50);
  sphereDetail(25);
  fill( 33, 33, 33 );
  rotate(frameCount / 30.0);
  sphere(radio);
}

// ************************************************ SKENE 2 *******************************
void drawScene2() {
  background(cloud1);
  fill(209,233,233); // alaosan väri
  beginShape();
  float xoff = 0;
  //Horisontaalisesti määritetty loopilla
  for (float xmuuttuja = 0; xmuuttuja <= width; xmuuttuja ++) 
    {
    //ymuuttuja mäpätty noisen suhteen
    float ymuuttuja = map(noise(xoff, yoff), 0, 1, 200, 800);
    vertex(xmuuttuja, ymuuttuja);
    xoff = xoff + 0.05;
    }
    yoff = yoff + 1;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);

  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

    translate(location.x, location.y);
  //noStroke();
  stroke(255, 50);
  sphereDetail(25);
  fill( 33, 33, 33 );
  rotate(frameCount / 30.0);
  sphere(radio);
}

// ***************************************** SKENE 3 **************************************
void drawScene3() {
  background(cloud1);
  fill(209,233,233); // alaosan väri
  beginShape();
  float xoff = 0;
  //Horisontaalisesti määritetty loopilla
  for (float xmuuttuja = 0; xmuuttuja <= width; xmuuttuja ++) 
    {
    //ymuuttuja mäpätty noisen suhteen
    float ymuuttuja = map(noise(xoff, yoff), 0, 1, 300, 900);
    vertex(xmuuttuja, ymuuttuja);
    xoff = xoff + 0.05;
    }
    yoff = yoff + 0.01;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);

  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 300)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.96; 
    //location.y = height;
  }

  translate(location.x, location.y);
  stroke(255, 50);
  sphereDetail(25);
  fill( 33, 33, 33 );
  rotate(frameCount / 30.0);
  sphere(radio);
}

// MUSIIKKI MUUTTUU TÄSSÄ KOHTAA - VOILA KARVAPALLO! **************************************
void drawScene4() {
  
  int x = frameCount % clouds3.width;
  copy(clouds3, x, 0, clouds3.width, height, 0, 0, clouds3.width, height);
  int x2 = clouds3.width - x;
  if (x2 < width) {
    copy(clouds3, 0, 0, clouds3.width, height, x2, 0, clouds3.width, height);
  }

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
  
  rx = rx*0.9 + 50;
  ry = ry*0.9 + 50;
  translate(location.x, location.y);
  rotateY(rx);
  rotateX(ry);
  rotate(frameCount / 30.0);
  fill(0);
  noStroke();
  sphereDetail(30);
  sphere(radio);

  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar();
  }
}

// MUSIIKKI MUUTTUU TÄSSÄ KOHTAA 2. KERRAN ********************************************
void drawScene5() {
  
  int x = frameCount % clouds3.width;
  copy(clouds3, x, 0, clouds3.width, height, 0, 0, clouds3.width, height);
  int x2 = clouds3.width - x;
  if (x2 < width) {
    copy(clouds3, 0, 0, clouds3.width, height, x2, 0, clouds3.width, height);
  }

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
  
  rx = rx*0.9 + 50;
  ry = ry*0.9 + 50;
  translate(location.x, location.y);
  rotateY(rx);
  rotateX(ry);
  rotate(frameCount / 30.0);
  fill(0);
  noStroke();
  sphere(radio);

  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar2();
  }
}

// ****************************************** SKENE 6 ************************************
void drawScene6() {
  
  int x = frameCount % clouds3.width;
  copy(clouds3, x, 0, clouds3.width, height, 0, 0, clouds3.width, height);
  int x2 = clouds3.width - x;
  if (x2 < width) {
    copy(clouds3, 0, 0, clouds3.width, height, x2, 0, clouds3.width, height);
  }

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

  rx = rx*0.9 + 50;
  ry = ry*0.9 + 50;
  translate(location.x, location.y);
  rotateY(rx);
  rotateX(ry);
  rotate(frameCount / 30.0);
  fill(0);
  noStroke();
  sphere(radio);

  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar3();
  }
}

// ******************************************** SKENE 7 ***********************************
void drawScene7() {
  
  int x = frameCount % clouds4.width;
  copy(clouds4, x, 0, clouds4.width, height, 0, 0, clouds4.width, height);
  int x2 = clouds4.width - x;
  if (x2 < width) {
    copy(clouds4, 0, 0, clouds4.width, height, x2, 0, clouds4.width, height);
  }

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

  rx = rx*0.9 + 50;
  ry = ry*0.9 + 50;
  translate(location.x, location.y);
  rotateY(rx);
  rotateX(ry);
  rotate(frameCount / 30.0);
  fill(0);
  noStroke();
  sphere(radio);

  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar4();
  }
}

// ********************************************** SKENE 8 *********************************
void drawScene8() {
  
  int x = frameCount % clouds5.width;
  copy(clouds5, x, 0, clouds5.width, height, 0, 0, clouds5.width, height);
  int x2 = clouds5.width - x;
  if (x2 < width) {
    copy(clouds5, 0, 0, clouds5.width, height, x2, 0, clouds5.width, height);
  }
  /*
  background(stars); //yläosan väri
  fill(0); // alaosan väri
  beginShape();
  float xoff = 0;
  //Horisontaalisesti määritetty loopilla
  for (float xmuuttuja = 0; xmuuttuja <= width; xmuuttuja ++) 
    {
    //ymuuttuja mäpätty noisen suhteen
    float ymuuttuja = map(noise(xoff, yoff), 0, 1, 200, 800);
    vertex(xmuuttuja, ymuuttuja);
    xoff = xoff + 0.05;
    }
    yoff = yoff + 1;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
  */
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

  rx = rx*0.9 + 50;
  ry = ry*0.9 + 50;
  translate(location.x, location.y);
  rotateY(rx);
  rotateX(ry);
  rotate(frameCount / 40.0);
  fill(0);
  noStroke();
  sphere(radio);

  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar5();
  }
}

// ************************************** SKENE 9 *****************************************
void drawScene9() {
  int x = frameCount % clouds5.width;
  copy(clouds5, x, 0, clouds5.width, height, 0, 0, clouds5.width, height);
  int x2 = clouds5.width - x;
  if (x2 < width) {
    copy(clouds5, 0, 0, clouds5.width, height, x2, 0, clouds5.width, height);
  }

  image(lettu, (width - lettu.width/5), (height - lettu.height/5), lettu.width/5, lettu.height/5);
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

  rx = rx*0.9 + 50;
  ry = ry*0.9 + 50;
  translate(location.x, location.y);
  rotateY(rx);
  rotateX(ry);
  rotate(frameCount / 50.0);
  fill(0);
  noStroke();
  sphere(radio);

  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar6();
  }
}

// IHAN LOPPUHÄIVYTYS *********************** LOPPU ***************************************
void drawScene10() {
   background(clouds3); //yläosan väri
   fill (0);
  beginShape();
  float xoff = 0;
  //Horisontaalisesti määritetty loopilla
  for (float xmuuttuja = 0; xmuuttuja <= width; xmuuttuja ++) 
    {
    //ymuuttuja mäpätty noisen suhteen
    float ymuuttuja = map(noise(xoff, yoff), 0, 1, 200, 700);
    vertex(xmuuttuja, ymuuttuja);
    xoff = xoff + -5;
    }
    yoff = yoff + 0;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);

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
  
  void dibujar2() {

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

    strokeWeight(2);
    beginShape(LINES);
    stroke(0 );
    vertex(x, y, z);
    stroke(  252, 228, 236 );
    vertex(xb, yb, zb);
    endShape();
  }
  
  void dibujar3() {

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
    stroke(0 );
    vertex(x, y, z);
    stroke(248, 187, 208 );
    vertex(xb, yb, zb);
    endShape();
  }
  
  void dibujar4() {

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

    strokeWeight(4);
    beginShape(LINES);
    stroke(0 );
    vertex(x, y, z);
    stroke(  3, 169, 244 );
    vertex(xb, yb, zb);
    endShape();
  }
  
  void dibujar5() {

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

    strokeWeight(5);
    beginShape(LINES);
    stroke(0 );
    vertex(x, y, z);
    stroke(  244, 143, 177 );
    vertex(xb, yb, zb);
    endShape();
  }
  
  void dibujar6() {

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

    strokeWeight(6);
    beginShape(LINES);
    stroke(0 );
    vertex(x, y, z);
    stroke(  76,216,99 );
    vertex(xb, yb, zb);
    endShape();
  }
}
