float[] catX = new float[3];
float[] catZ = new float[3];
float[] catDirection = new float[3];
float catSpeed = 0.25;

void drawCats()
{
  for (int i = 0; i < 3; i++) {
    pushMatrix();
    translate(catX[i], 4, catZ[i]);
    rotateX(radians(90));
    scale(0.05);
    shape(catModel);
    popMatrix();

    // Kedileri rastgele doğruda ilerletin
    float deltaX = catSpeed * cos(catDirection[i]);
    float deltaZ = catSpeed * sin(catDirection[i]);
    catX[i] += deltaX;
    catZ[i] += deltaZ;

    // köpeğin kedi ile çarpışması ve skor
    float distance = dist(dogX, dogZ, catX[i], catZ[i]);
    if (distance < contactDistance) {
      // Köpek ve kedi temas halinde ise, kedinin yerine geriye sekme
      catDirection[i] += radians(60);
      catDirection[i] %= TWO_PI;
      score++;
    }

    // Kedilerin x=0 ve z=0 noktasındaki daireye çarpmasını kontrol edin
    float circleRadius = 2;
    float circleDistance = dist(0, 0, catX[i], catZ[i]);
    if (circleDistance < circleRadius) {
      background(0);
      fill(255);
      text("Game Over",width/2 - 100, height/2);
      text("R tuşuna basarak yeniden başlayın", width/2 - 200, height/2 + 50);  // Restart mesajı
      
      noLoop();
    }


    // Kedilerin ground ile çarpışmasını kontrol edin
    if (catX[i] < -17 || catX[i] > 17 || catZ[i] < -17 || catZ[i] > 17) {
      // Kedi kenara çarptığında yönünü tam tersine çevirin
      catDirection[i] += radians(60);
      catDirection[i] %= TWO_PI;  // Yönü 0 ile 2PI arasında tutmak için mod alın
    }
  }
}
