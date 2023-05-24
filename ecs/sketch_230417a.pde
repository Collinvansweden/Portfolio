// Collin Van Sweden | 17 April | EtchASketch
int x, y;
PImage pic;

void setup() {
  size(800, 650);
  x = width/2;
  y = height/2;
  background(127);
  pic = loadImage("Etch.png");
}

void draw() {
  image(pic, 0, 0);
  stroke(5);
  strokeWeight(3);
  //fill(int(random(50, 200)), int(random(50, 200)), int(random(50, 200));
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      moveLeft(5);
    } else if (key == 'w' || key == 'W') {
      moveUp(5);
    } else if (key == 's' || key == 'S') {
      moveDown(5);
    } else if (key == 'd' || key == 'D') {
      moveRight(5);
    }
  }
}
void mousePressed() {
  saveFrame("line-######.png");
}

void keyPressed() {
}

void moveRight(int rep) {
  for (int i=0; i<rep; i=i+1) {
    point(x+i, y);
  }
  x = x + rep;
}

void moveLeft(int rep) {
   for (int i=0; i<rep; i=i+1) {
    point(x-i, y);
  }
  x = x - rep;
}

void moveUp(int rep) {
   for (int i=0; i<rep; i=i+1) {
    point(x, y-i);
  }
  y = y - rep;
}

void moveDown(int rep) {
   for (int i=0; i<rep; i=i+1) {
    point(x, y+i);
  }
  y = y + rep;
}
