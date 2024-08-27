PImage imgTreeBottom, imgTreeTop, imgGround, imgLog, imgTent, imgTentDoor, imgBackground;
PShape dogModel, catModel;  
float contactDistance = 2;  

int score = 0;
boolean gameOver = false;
boolean gameWon = false;
int totalTime = 120;  
int remainingTime = totalTime;  
boolean isPaused = false;  // Oyunun duraklatıldığını kontrol eden bir değişken
void setup() {
 
  fullScreen(P3D);
  
    float angle = 360.0 / tubeRes;
  for (int i = 0; i < tubeRes; i++) {
    tubeX[i] = cos(radians(i * angle));
    tubeY[i] = sin(radians(i * angle));
  }
  
  dogModel = loadShape("Dog.obj");  // Replace "d
  dogX = 0;
  dogZ = 0;

  catModel = loadShape("Cat.obj");  
  for (int i = 0; i < 3; i++) {
    catX[i] = random(-17, 17);
    catZ[i] = random(-17, 17);
    catDirection[i] = random(TWO_PI); 
  }
 
  camZ = (height/2) / tan((PI*60.0)/360.0)+600;
  imgTreeBottom = loadImage("treeBott.jpg");
  imgTreeTop = loadImage("treeTop.jpg");
  imgGround = loadImage("ground.jpg");
  imgLog = loadImage("log.jpg");
  imgTent = loadImage("tent.jpg");
  imgTentDoor = loadImage("door.jpg");
  imgBackground = loadImage("background.jpg");
  imgBackground.resize(width, height);
 
  textureMode(NORMAL);
  noStroke();
}

float camZ = 0;
float rotX = 0, rotY = 0;
float lastX, lastY;
float distX, distY;

void draw() {
  
  background(imgBackground);
  
    camera(0, -800, camZ, 
  0, 0, 0, 
  0, 1, 0);
  
  rotateX(rotX + distY);
  rotateY(rotY + distX);
  
  
  textAlign(RIGHT,TOP);
  textSize(58);
  fill(255);
  text("Score:"+score,1300,-800);
  remainingTime = totalTime - round(millis() / 1000);
  
  int minutes = remainingTime / 60;
  int seconds = remainingTime % 60;
  String timeText = nf(minutes, 2) + ":" + nf(seconds, 2);
  text(timeText, -1000, -800);
  
  if (remainingTime <= 0) {
    noLoop();
    text("Time's up!", 50, -800);
    text("You Win", 30, -700);
  }

  scale(50);
  drawTree();
  drawGround();
  drawStump();
  drawTent();
  drawTentDoor();
  drawFirePit();
  drawCats();
  drawDog();

  if (keyPressed) {
    if (key == 'w'||key == 'W')
      camZ -= 5;
    if (key == 's'||key=='S')
      camZ += 5;
  }
  
}
void restartGame() {
  // Kedilerin ve köpeğin pozisyonlarını sıfırlıyoruz
  dogX = 0;
  dogZ = 0;

  for (int i = 0; i < 3; i++) {
    catX[i] = random(-17, 17);
    catZ[i] = random(-17, 17);
    catDirection[i] = random(TWO_PI); 
  }

  // Oyun ekranını sıfırlıyoruz
  background(0);  
  fill(255);  
  textSize(40);  
  
  // Oyun döngüsünü yeniden başlatıyoruz
  loop();
}

void keyPressed() { 
  if (key == 'r' || key == 'R') {
    restartGame();
  }
  
  if (keyCode == ENTER) {
    background(0);  
    fill(255);  
    textSize(40);  
    noLoop(); // Döngüyü durduruyor
  } 
}


void mousePressed() {
  lastX = mouseX;
  lastY = mouseY;
}

void mouseDragged() {
  distX = radians(mouseX - lastX);
  distY = radians(lastY - mouseY);
}

void mouseReleased() {
  rotX += distY;
  rotY += distX;
  distX = distY = 0;
}
