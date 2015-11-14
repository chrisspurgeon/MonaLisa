Painting p;
Painting q;

void setup() {
  p = new Painting(500,500);
  p.createRandomImage();
  p.save("101.jpg");

  q = new Painting(500,500);
  q.createRandomImage();

println(p.calculateDiffence(p.img));


}

void draw() {
  
}