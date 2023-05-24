Ball ball; 
Paddle paddleLeft;
Paddle paddleRight;
int scoreLeft = 0;
int scoreRight = 0;
boolean gameStarted = false;

void setup() {
  size(800, 600);
  ball = new Ball(width/2, height/2, 50); 
  ball.speedX = 5; 
  ball.speedY = random(-3, 3); 
  
  paddleLeft = new Paddle(15, height/2, 30, 200);
  paddleRight = new Paddle(width-15, height/2, 30, 200);

  startScreen(); // Display start screen initially
}

void draw() {
  if (!gameStarted) {
    return; // Don't update the game if it hasn't started yet
  }
  
  background(0); 
  ball.move(); 
  ball.display(); 
  
  paddleLeft.move();
  paddleLeft.display();
  paddleRight.move();
  paddleRight.display();

  if (ball.right() > width) {
    scoreLeft = scoreLeft + 1;
    ball.x = width/2;
    ball.y = height/2;
  }
  if (ball.left() < 0) {
    scoreRight = scoreRight + 1;
    ball.x = width/2;
    ball.y = height/2;
  }

  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }
  
  if (paddleLeft.bottom() > height) {
    paddleLeft.y = height-paddleLeft.h/2;
  }

  if (paddleLeft.top() < 0) {
    paddleLeft.y = paddleLeft.h/2;
  }
    
  if (paddleRight.bottom() > height) {
    paddleRight.y = height-paddleRight.h/2;
  }

  if (paddleRight.top() < 0) {
    paddleRight.y = paddleRight.h/2;
  }
  
  if (ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()){
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleLeft.y, -paddleLeft.h/2, paddleLeft.h/2, -10, 10);
  }

  if (ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleRight.y, -paddleRight.h/2, paddleRight.h/2, -10, 10);
  }
  
  if (scoreLeft > 10 || scoreRight > 10) {
    gameOver();
  }
  
  textSize(40);
  textAlign(CENTER);
  text(scoreRight, width/2+30, 30); 
  text(scoreLeft, width/2-30, 30); 
}

void keyPressed() {
  if (!gameStarted) {
    gameStarted = true; // Start the game when any key is pressed
    return;
  }
  
  if (keyCode == UP) {
    paddleRight.speedY = -3;
  }
  if (keyCode == DOWN) {
    paddleRight.speedY = 3;
  }
  if (key == 'a') {
    paddleLeft.speedY = -3;
  }
  if (key == 'z') {
    paddleLeft.speedY = 3;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    paddleRight.speedY = 0;
  }
  if (keyCode == DOWN) {
    paddleRight.speedY = 0;
  }
  if (key == 'a') {
    paddleLeft.speedY = 0;
  }
  if (key == 'z') {
    paddleLeft.speedY = 0;
  }
}

class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
  
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = color(225); 
  }
  
  void move() {
    y = y + speedY;
    x = x + speedX;
  }
  
  void display() {
    fill(c); 
    ellipse(x, y, diameter, diameter); 
  }
  
  float left() {
    return x - diameter/2;
  }
  
  float right() {
    return x + diameter/2;
  }
  
  float top() {
    return y - diameter/2;
  }
  
  float bottom() {
    return y + diameter/2;
  }
}

class Paddle {
  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color c;
  
  Paddle(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c = color(255);
  }

  void move() {
    y += speedY;
    x += speedX;
  }

  void display() {
    fill(c);
    rect(x-w/2, y-h/2, w, h);
  } 
  
  float left() {
    return x - w/2;
  }
  
  float right() {
    return x + w/2;
  }
  
  float top() {
    return y - h/2;
  }
  
  float bottom() {
    return y + h/2;
  }
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Welcome to Pong!", width/2, height/2);
  text("by Collin Van Sweden", width/2, height/2.2);
  text("Press any key to start the game", width/2, height/2.4);
}

void gameOver() {
  background(0);
  fill(255);
  textSize(40);
  textAlign(CENTER);
  text("Game Over!", width/2, 380);
  text("Score: 1 ", width/2, 420);
  text("Level: 1 ", width/2, 460);
  noLoop();
}

void infoPanel() {
  fill(128, 128);
  rect(0, 0, width, 80);
  fill(0);
  text("Score: ", 20, 70);
}
