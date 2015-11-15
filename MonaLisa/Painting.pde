class Painting {
  
  PImage img;
  int id;
  int counter = 0;
  long difference = 0;

  Painting(int w, int h, int idNumber) {
   img = createImage(w,h,RGB); 
   id = idNumber;
  }
  
  
  void createRandomImage() {
    color c;
    img.loadPixels();
    int len = img.pixels.length;
    for (int i = 0; i < len; i++) {
      c = color(random(255), random(255), random(255));
      img.pixels[i] = c;
    }
    img.updatePixels();
  }
  
  void colorImage(color c) {
    img.loadPixels();
    int len = img.pixels.length;
    for (int i = 0; i < len; i++) {
      img.pixels[i] = c;
    }
    img.updatePixels();
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
  
  long calculateDifference(PImage baseImage) {
    long total = 0;
    color baseImageColor;
    color imageColor;
//    baseImage.loadPixels();
    img.loadPixels();
    if (baseImage.pixels.length >= img.pixels.length) {
      for (int i = 0; i < img.pixels.length; i++) {
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
    img.loadPixels();
    color c;
    int offset;
    println("New image!");
    for (int i = 1; i <= count; i++) {
      offset = floor(random(img.pixels.length));
      //println(offset);
      c = color(int(random(256)), int(random(256)), int(random(256)));
      img.pixels[offset] = c;
      println("changing pixel " + offset);
    }
    img.updatePixels();
  }
}