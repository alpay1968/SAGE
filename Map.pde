float flameRadius = 0.5;
float flameDetail = 50;
float flameSpeed = 0.02;

int tubeRes = 30;
float[] tubeX = new float[tubeRes];
float[] tubeY = new float[tubeRes];

void drawTree()
{

  float radius = 1;
  float height = 8;
  pushMatrix();
  translate(-7, 0, -8.5);
  beginShape(QUAD_STRIP);
  texture(imgTreeBottom);

  float angle = 0;
  float angleIncrement = TWO_PI / tubeRes;

  for (int i = 0; i <= tubeRes; i++) {
    float x = radius * cos(angle);
    float z = radius * sin(angle);
    float u = i / (float) tubeRes;

    vertex(x, -height / 2, z, u, 0);
    vertex(x, height / 2, z, u, 1);

    angle += angleIncrement;
  }
  endShape();
  popMatrix();

  int w = 1;
  int h = 1;

  beginShape(QUADS);
  texture(imgTreeTop);
  //+Z face
  vertex(-10, -6, -5, 0, 0); //upper left corner
  vertex(-4, -6, -5, w, 0); //upper right corner
  vertex(-4, -1, -5, w, h); //bottom right corner
  vertex(-10, -1, -5, 0, h); //bottom left corner

  //-Z face
  vertex(-10, -6, -12, 0, 0); //upper left corner
  vertex(-4, -6, -12, w, 0); //upper right corner
  vertex(-4, -1, -12, w, h); //bottom right corner
  vertex(-10, -1, -12, 0, h); //bottom left corner

  //+X face
  vertex(-4, -6, -5, 0, 0); //upper left corner
  vertex(-4, -6, -12, w, 0);
  vertex(-4, -1, -12, w, h);
  vertex(-4, -1, -5, 0, h);

  //-X face
  vertex(-10, -6, -5, 0, 0); //upper left corner
  vertex(-10, -6, -12, w, 0);
  vertex(-10, -1, -12, w, h);
  vertex(-10, -1, -5, 0, h);

  //-Y face
  vertex(-10, -6, -5, 0, 0);
  vertex(-4, -6, -5, w, 0);
  vertex(-4, -6, -12, w, h);
  vertex(-10, -6, -12, 0, h);

  //+Y face
  vertex(-10, -1, -5, 0, 0);
  vertex(-4, -1, -5, w, 0);
  vertex(-4, -1, -12, w, h);
  vertex(-10, -1, -12, 0, h);
  endShape();
}

void drawStump()
{
  int w = 1;
  int h = 1;

  beginShape(QUADS);
  texture(imgLog);
  //+Z face
  vertex(-13, 3, 9, 0, 0); //upper left corner
  vertex(-12, 3, 8, w, 0); //upper right corner
  vertex(-12, 4, 8, w, h); //bottom right corner
  vertex(-13, 4, 9, 0, h); //bottom left corner

  //-Z face
  vertex(-7, 3, 15, 0, 0); //upper left corner
  vertex(-6, 3, 14, w, 0); //upper right corner
  vertex(-6, 4, 14, w, h); //bottom right corner
  vertex(-7, 4, 15, 0, h); //bottom left corner

  //+X face
  vertex(-6, 3, 14, 0, 0); //upper left corner
  vertex(-12, 3, 8, w, 0);
  vertex(-12, 4, 8, w, h);
  vertex(-6, 4, 14, 0, h);

  //-X face
  vertex(-7, 3, 15, 0, 0); //upper left corner
  vertex(-13, 3, 9, w, 0);
  vertex(-13, 4, 9, w, h);
  vertex(-7, 4, 15, 0, h);

  //-Y face
  vertex(-6, 4, 14, 0, 0);
  vertex(-12, 4, 8, w, 0);
  vertex(-13, 4, 9, w, h);
  vertex(-7, 4, 15, 0, h);

  //+Y face
  vertex(-6, 3, 14, 0, 0);
  vertex(-12, 3, 8, w, 0);
  vertex(-13, 3, 9, w, h);
  vertex(-7, 3, 15, 0, h);
  endShape();
}

void drawGround()
{
  int w = 1;
  int h = 1;
  beginShape(QUAD);
  texture(imgGround);

  vertex(-18, 4.0001, 18, 0, 0);
  vertex(18, 4.0001, 18, w, 0);
  vertex(18, 4.0001, -18, w, h);
  vertex(-18, 4.0001, -18, 0, h);
  endShape();
}

void drawTent()
{
  int w = 1, h = 1;
  beginShape(QUADS);
  texture(imgTent);

  //-Y face
  vertex(15, 4, -15, 0, 0);
  vertex(15, 4, -3, w, 0);
  vertex(8, 4, -3, w, h);
  vertex(8, 4, -15, 0, h);

  vertex(12, -3, -15, w, h);
  vertex(15, 4, -15, 0, h);
  vertex(15, 4, -3, 0, 0);
  vertex(12, -3, -3, w, 0);

  vertex(12, -3, -15, w, h);
  vertex(8, 4, -15, 0, h);
  vertex(8, 4, -3, 0, 0);
  vertex(12, -3, -3, w, 0);

  vertex(12, -3, -3, w, h);
  vertex(8, 4, -3, 0, h);
  vertex(15, 4, -3, 0, 0);
  vertex(15, 4, -3, w, 0);

  vertex(12, -3, -15, w, h);
  vertex(8, 4, -15, 0, h);
  vertex(15, 4, -15, 0, 0);
  vertex(15, 4, -15, w, 0);
  endShape();
}

void drawTentDoor()
{
  int w = 1;
  int h = 1;


  beginShape(QUADS);
  texture(imgTentDoor);

  vertex(13, 0, -3+00000000.1, 0, 0); //upper left corner
  vertex(11, 0, -3+00000000.1, w, 0); //upper right corner
  vertex(11, 4, -3+00000000.1, w, h); //bottom right corner
  vertex(13, 4, -3+00000000.1, 0, h); //bottom left corner
  endShape();
}

void drawFirePit() {
  pushMatrix();
  translate(0, 3.8, 0);
  noStroke();

  fill(95, 95, 95);

  float radius = 1.5;
  int detail = 30;
  float angle = TWO_PI / detail;

  for (int i = 0; i < detail; i++) {
    float x = cos(i * angle) * radius;
    float z = sin(i * angle) * radius;

    pushMatrix();
    translate(x, 0, z);
    sphere(0.2);
    popMatrix();
  }

  for (int j = 0; j < flameDetail; j++) {
    fill(random(200, 255), random(100, 150), 0);

    float flameAngle = j * TWO_PI / flameDetail;
    float flameX = cos(flameAngle) * flameRadius;
    float flameZ = sin(flameAngle) * flameRadius;
    float flameY = sin(frameCount * flameSpeed + j) * 0.2;

    pushMatrix();
    translate(flameX, flameY, flameZ);
    float flameSize = random(0.1, 0.5);
    sphere(flameSize);
    popMatrix();
  }

  fill(255, 0, 0);
  sphere(0.5);
  popMatrix();
}
