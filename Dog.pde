float dogX = 0;
float dogZ = 0;
float dogSpeed = 0.4;

void drawDog()
{
   pushMatrix();
  translate(dogX, 4, dogZ);
  rotateX(radians(90)); 
  scale(0.12);
  shape(dogModel);
  popMatrix();
  
  // Move the dog based on arrow key input
  if (keyPressed) {
    if (keyCode == UP && dogZ > -17) {
      dogZ -= dogSpeed;
    } else if (keyCode == DOWN && dogZ < 17) {
      dogZ += dogSpeed;
    } else if (keyCode == LEFT && dogX > -17) {
      dogX -= dogSpeed;
    } else if (keyCode == RIGHT && dogX < 17) {
      dogX += dogSpeed;
    }
  }
}
