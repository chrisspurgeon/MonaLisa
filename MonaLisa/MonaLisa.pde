Painting p;
Painting q;

void setup() {
  p = new Painting(500,500);
  p.createRandomImage();
  p.img.save("2.jpg");
  p.mutate(10000);
  p.img.save("3.jpg");
  q = new Painting(500,500);
  q.createRandomImage();

println(p.calculateDiffence(p.img));


}

void draw() {
  
}