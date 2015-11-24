Painting[] variations;
int populationSize = 200;
int width = 500;
int height = 500;
PImage MonaLisa;
PImage seedImage;
long thisImageError;
long smallestError;
int generation = 145200;   // set starting generation
int mutationRate = 10;
int bestVariation = 0;
color initialColor;

void setup() {
  size(500,500);
  background(255);
  
  MonaLisa = loadImage("../Mona_Lisa_500.jpg");
  seedImage = loadImage("../145200_generations.png");
  initialColor = color(255, 255, 255);
 
  variations = new Painting[populationSize];
  
  for (int i = 0; i < populationSize; i++) {
    variations[i] = new Painting(width, height, i);
//    variations[i].colorImage(initialColor);
    variations[i].img.copy(seedImage, 0, 0, width, height, 0, 0, width, height);
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

  println("\n\nGeneration " + generation + " -- Best variation is " + smallestError);
//  if (generation % 100 == 0) {
    image(variations[bestVariation].img, 0, 0);
    
//  }
  
  for (int i = 0; i < populationSize; i++) {
   variations[i].img.copy(variations[bestVariation].img, 0, 0, width, height, 0, 0, width, height);
  }
}