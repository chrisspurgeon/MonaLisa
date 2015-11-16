Painting[] variations;
int populationSize = 500;
int width = 200;
int height = 200;
PImage MonaLisa;
PImage teststartImage;
long thisImageError;
long smallestError;
int generation = 0;
int mutationRate = 10;
int bestVariation = 0;
color initialColor;

void setup() {
  size(200,200);
  MonaLisa = loadImage("../Mona_Lisa_200.jpg");
  teststartImage = loadImage("../testsquare.png");
  image(MonaLisa, 0,0);
  initialColor = color(255, 255, 255);
 
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

  println("\n\nGeneration " + generation);
  if (generation % 100 == 0) {
    image(variations[bestVariation].img, 0, 0);
  }
  
  for (int i = 0; i < populationSize; i++) {
   variations[i].img.copy(variations[bestVariation].img, 0, 0, width, height, 0, 0, width, height);
  }
}