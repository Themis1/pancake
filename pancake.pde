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

void setup() {

  size(880, 660, P3D);
  location = new PVector(440,330);
  velocity = new PVector(0,2.1);
  gravity = new PVector(0,0.2);
}

void draw() {
  background(0);
  
  // Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  if (location.y > (height - 150)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -1; 
    //location.y = height;
  }

  // Display circle at location vector
  stroke(255);
  strokeWeight(2);
  fill(97);
  ellipse(location.x,location.y,200,200);

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
