Painting[] variations;
int populationSize = 5000;
int width = 100;
int height = 100;
PImage MonaLisa;
long thisImageError;
long smallestError;
int generation = 0;
int mutationRate = 5;
int bestVariation = 0;
color initialColor;

void setup() {
  size(800,800);
  MonaLisa = loadImage("../Mona_Lisa_ORIG.jpg");
  MonaLisa.loadPixels();
  image(MonaLisa, 0,0);
  initialColor = color(255, 255, 255);
  

  variations = new Painting[populationSize];
  
  for (int i = 0; i < populationSize; i++) {
    variations[i] = new Painting(width, height, i);
    //variations[i].createRandomImage();
    variations[i].colorImage(initialColor);
    println("Creating variation #" + i);
  }
    
    
  /*
  p = new Painting(500,500);
  p.createRandomImage();
  p.img.save("2.jpg");
  p.mutate(10000);
  p.img.save("3.jpg");
  q = new Painting(500,500);
  q.createRandomImage();
  println(p.calculateDiffence(p.img));
  */

}

void draw() {
  generation++;
  smallestError = width * height * 255 * 3;
  if (generation % 100 == 0) {
    println("\n\nGeneration " + generation);
  }
  for (int i = 0; i < populationSize; i++) {
    variations[i].mutate(mutationRate);
    thisImageError = variations[i].calculateDifference(MonaLisa);
    //println("Image " + i + " has an error of " + thisImageError);
    if (thisImageError < smallestError) {
      //println("Image number " + i + " has the new smallest value: " + thisImageError);
      smallestError = thisImageError;
      bestVariation = i;
    }
  }
//  println("Smallest error is " + smallestError);
  variations[bestVariation].img.loadPixels();
  image(variations[bestVariation].img, 0, 0);
  for (int i = 0; i < populationSize; i++) {
    variations[i].img.pixels = variations[bestVariation].img.pixels;
    variations[i].img.updatePixels();
  }
  //println("TESTING! Difference should be 0. Actual difference is " + variations[10].calculateDifference(variations[20].img));
}