/*class tausta() {
  PImage [] ground = new PImage[10];
  float [] xx = new float [10];
  
  float blockW, blockH, blockX, blockY, blockS;
  float grav = 3;
  
  float theta = 0.0f;
  float radius = 1;
  
  float cx, cy;
  
  int speed = 5;
  int bgSpeed = 2;
  
  block = 100;




void setup() {
  blockW = 100;
  blockH = blockW;
  blockY = height - blockW;
  blockS = 5;
  
  cx = width * 0.5f;
  cy = height * 0.5f;
  
  for (int i = 0; i < 10; i ++) {
    ground[i] = loadImage("ground.png");
    xx[i] = blockW * i;
  }
}

void sprites() {
  for (int k=0; i < xx.length; k++) {
    image(ground[i], xx[i] blockY);
    xx[i] -= blockS;
    
    if (xx[i] + blockW <= 0) {
      xx[i] = width;
    }
  }
}
*/
