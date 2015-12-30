Painting[] variations;
int populationSize = 200;
int width = 500;
int height = 500;
PImage MonaLisa;
PImage teststartImage;
long thisImageError;
long smallestError;
int generation = 520401;
int mutationRate = 3;
int bestVariation = 0;
color initialColor;
float percentageAccuracy;

void setup() {
  size(500,500);
  background(255);
  
  MonaLisa = loadImage("../Mona_Lisa_500.jpg");
    teststartImage = loadImage("OUTPUT/ML-0520400.png");
//  image(MonaLisa, 0,0);
  initialColor = color(0, 0, 0);
 
  variations = new Painting[populationSize];
  
  for (int i = 0; i < populationSize; i++) {
    variations[i] = new Painting(width, height, i);
    variations[i].colorImage(initialColor);
    variations[i].img.copy(teststartImage, 0, 0, width, height, 0, 0, width, height);
    println("Creating variation #" + i);
  }

}

void draw() {
  generation++;
  smallestError = width * height * 255 * 3;
  for (int i = 0; i < populationSize; i++) {
    if (i != 0) {
      variations[i].mutate(mutationRate);
    }
    thisImageError = variations[i].calculateDifference(MonaLisa);
    if (thisImageError < smallestError) {
      smallestError = thisImageError;
      bestVariation = i;
    }
  }
  
  percentageAccuracy = smallestError / (255 * 255 * 255 * height * width);
  println("\n\nGeneration " + generation + " -- Best variation is " + smallestError + " (accuracy: " + percentageAccuracy + ")");
  if (generation % 5 == 0) {
    image(variations[bestVariation].img, 0, 0);
  }
  if (generation % 100 == 0) {
    image(variations[bestVariation].img, 0, 0);
    if (generation < 1000000) {
      saveFrame("OUTPUT/ML-0" + generation + ".png");
    } else {
      saveFrame("OUTPUT/ML-" + generation + ".png");
    }
  }
  
  for (int i = 0; i < populationSize; i++) {
   variations[i].img.copy(variations[bestVariation].img, 0, 0, width, height, 0, 0, width, height);
  }
}