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

  PImage [] ground = new PImage[10];
  float [] xx = new float [10];
  
  float blockW, blockH, blockX, blockY, blockS;
  //float grav = 3;
  
  //float theta = 0.0f;
  //float radius = 1;
  
  float cx, cy;
  
  int speed = 5;
  int bgSpeed = 2;
  
  
  int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int maxwaves = 4;   // total # of waves to add together

float theta = 0.0;
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;


// **************************** SETUP ****************************************************
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
  
  blockW = 100;
  blockH = blockW;
  blockY = height - blockW;
  blockS = 5;
  
  cx = width * 0.5f;
  cy = height * 0.5f;
  
  for (int i = 0; i < 10; i ++) {
    ground[i] = loadImage("ground.png");
    //xx[i] = blockW * i;
  }
  
  w = width + 16;
  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(10,30);
    float period = random(100,300); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing;
  }

  yvalues = new float[w/xspacing];

  moonlander.start(); 
}

// ************************************** DRAW ******************************************
void draw() {
  moonlander.update();
  background(0);
  sprites();
  calcWave();
  renderWave();
  int scene = moonlander.getIntValue("scene");
  //double value = moonlander.getValue("");
  //background((int)value);
  /*
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
  */
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

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

// **************************************** EKA SKENE *************************************
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
  fill(239, 235, 233);
  rotate(frameCount / 30.0);
  sphere(radio);
  //ellipse(location.x,location.y,200,200);
}

// ******************************************* SKENE 1 ************************************
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
  fill( 215, 204, 200 );
  rotate(frameCount / 30.0);
  //sphereDetail(20);
  //sphere(radio);
  //polygon(location.x,location.y,80,20);
  polygon(0,0,40,20);
}

// ************************************************ SKENE 2 *******************************
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
  fill(245, 245, 245);
  rotate(frameCount / 30.0);  
  sphere(radio);
  //ellipse(location.x,location.y,200,200);
}

// ***************************************** SKENE 3 **************************************
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
  //noStroke();
  stroke(255, 50);
  fill(238, 238, 238);
  rotate(frameCount / 30.0); 
  sphereDetail(50);
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
  //noStroke();
  stroke(255, 50);
  sphereDetail(25);
  fill(77,208,225);
  rotate(frameCount / 40.0);
  sphere(radio);
}

// ******************************************** SKENE 7 ***********************************
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
  rotate(frameCount / 30.0);
  sphere(radio);
}

// ********************************************** SKENE 8 *********************************
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
  rotate(frameCount / 30.0);
  sphere(radio);
}

// ************************************** SKENE 9 *****************************************
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
  rotate(frameCount / 30.0);
  sphere(radio);
}

// IHAN LOPPUHÄIVYTYS *********************** LOPPU ***************************************
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

  /*Pelo() { // what's wrong with a constructor here
    z = random(-radio, radio);
    phi = random(TWO_PI);
    largo = random(1.15, 1.2);
    theta = asin(z/radio);
  }*/

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
    stroke( 238, 238, 238 );
    vertex(xb, yb, zb);
    endShape();
  }
}

// ******************** TAUSTAKUVAA VARTEN ********************************************
void sprites() {
  for (int k=0; k < xx.length; k++) {
    image(ground[k], xx[k], blockY);
    xx[k] -= blockS;
    
    if (xx[k] + blockW <= 0) {
      xx[k] = width;
    }
  }
}


void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
 
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
      else yvalues[i] += cos(x)*amplitude[j];
      x+=dx[j];
    }
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  noStroke();
  fill(255,50);
  ellipseMode(CENTER);
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing,height/2+yvalues[x],16,16);
  }
}
