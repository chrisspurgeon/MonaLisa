Painting[] variations;
int populationSize = 200;
int width = 800;
int height = 800;
PImage MonaLisa;
PImage teststartImage;
long thisImageError;
long smallestError;
int generation = 0;
int mutationRate = 200;
int bestVariation = 0;
color initialColor;

void setup() {
  size(800,800);
  MonaLisa = loadImage("../Mona_Lisa_ORIG.jpg");
  teststartImage = loadImage("../testsquare.png");
  //MonaLisa.loadPixels();
  image(MonaLisa, 0,0);
  initialColor = color(255, 255, 255);
  

  variations = new Painting[populationSize];
  
  for (int i = 0; i < populationSize; i++) {
    variations[i] = new Painting(width, height, i);
    //variations[i].createRandomImage();
    variations[i].colorImage(initialColor);
    variations[i].img.copy(teststartImage, 0, 0, width, height, 0, 0, width, height);
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
  //variations[bestVariation].img.loadPixels();

  println("\n\nGeneration " + generation);
  if (generation % 100 == 0) {
    image(variations[bestVariation].img, 0, 0);
  }

  
  
  for (int i = 0; i < populationSize; i++) {
   variations[i].img.copy(variations[bestVariation].img, 0, 0, width, height, 0, 0, width, height);
   //variations[i].img.pixels = variations[bestVariation].img.pixels;
   //variations[i].img.updatePixels();
  }
  //println("TESTING! Difference should be 0. Actual difference is " + variations[10].calculateDifference(variations[20].img));
}