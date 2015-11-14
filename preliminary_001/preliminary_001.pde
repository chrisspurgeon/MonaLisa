color c;
float xPosition;
float yPosition;

void setup() {
  size(800,800);
  noStroke();
  background(255);
}

void draw() {
  xPosition = random(800);
  yPosition = random(800);
  c = color(random(255), random(255), random(255), 255 - (255 * (yPosition / 800)) );
  fill(c);
  ellipse(xPosition, yPosition, random(100), random(100));
  fill(255);
  ellipse(xPosition, yPosition, 20,20);
}