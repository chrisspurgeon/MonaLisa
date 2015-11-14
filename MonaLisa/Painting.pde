class Painting {
  
  PImage img;
  int counter = 0;
  long difference = 0;

  Painting(int w, int h) {
   img = createImage(w,h,RGB); 
  }
  
  
  void createRandomImage() {
    color c;
    img.loadPixels();
    int len = img.pixels.length;
    for (int i = 0; i < len; i++) {
      c = color(random(255), random(255), random(255));
      img.pixels[i] = c;
    }
    updatePixels();
  }
  
  void save(String path) {
    img.save(path);
  }
  
  void incrementCounter() {
    counter++;
  }
  
  int getCounter() {
    return counter;
  }
  
  void setCounter(int x) {
    counter = x;
  }
  
  void resetCounter() {
    counter = 0;
  }
  
  long calculateDiffence(PImage baseImage) {
    long total = 0;
    color baseImageColor;
    color imageColor;
    baseImage.loadPixels();
    if (baseImage.pixels.length == img.pixels.length) {
      for (int i = 0; i < baseImage.pixels.length; i++) {
        baseImageColor = baseImage.pixels[i];
        imageColor = img.pixels[i];
        total = total + abs(int(red(baseImageColor)) - int(red(imageColor)));        
        total = total + abs(int(blue(baseImageColor)) - int(blue(imageColor)));        
        total = total + abs(int(green(baseImageColor)) - int(green(imageColor)));        
      }
    }
    return total;
  }
  
  void mutate(int count) {
  }
}