PrintWriter output;

void setup() {
  size(640, 360);
  output = createWriter("curve.txt");
}

void draw() {
  if (mousePressed && !(pmouseX == mouseX && pmouseY == mouseY)) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    output.println(mouseX/float(width)+", "+mouseY/float(height));
  }
}

void mouseReleased() {
  output.flush();
  output.close();
  exit();
}
