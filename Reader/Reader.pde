String[] curves = {"star1.txt", "star2.txt", "star3.txt", "star4.txt", "moon1.txt", "moon2.txt", "moon3.txt", "moon4.txt", "wind1.txt", "wind2.txt", "wind3.txt", "wind4.txt", "wind5.txt", "wind6.txt", "wind7.txt", "wind8.txt", "wind9.txt", "wind10.txt", "wind11.txt", "wind12.txt", "wind13.txt", "wind14.txt", "wind15.txt", "terrain1.txt", "terrain2.txt", "terrain3.txt", "terrain4.txt", "terrain5.txt", "terrain6.txt", "terrain7.txt"};
color[] colors = new color[curves.length];

ArrayList<ArrayList<PVector>> curveVectors = new ArrayList<ArrayList<PVector>>();

Walker[] walkers;

PrintWriter output;

void setup() {
  size(640, 360);
  pixelDensity(displayDensity());

  parseFiles(curves);
  walkers = new Walker[200];
  for (int i = 0; i < curveVectors.size(); i++)
    for (int j = i*walkers.length/curveVectors.size(); j < (i+1)*walkers.length/curveVectors.size(); j++)
      walkers[j] = new Walker(i);
}

void draw() {
  background(15, 15, 30);

  for (int i = 0; i < walkers.length; i++) {
    walkers[i].update();
    walkers[i].display();
  }

  stroke(255);
  if (mousePressed && !(pmouseX == mouseX && pmouseY == mouseY)) {
    if (output == null)
      output = createWriter("curve.txt");

    line(mouseX, mouseY, pmouseX, pmouseY);
    output.println(mouseX/float(width)+", "+mouseY/float(height));
  }
}

void parseFiles(String[] files) {
  for (int i = 0; i < files.length; i++) {
    BufferedReader reader = createReader("curves/"+files[i]);
    String line = null;

    boolean first = true;

    ArrayList<PVector> fileVectors = new ArrayList<PVector>();
    try {
      while ((line = reader.readLine()) != null) {
        if (first) {
          String[] values = split(line, ", ");
          color c = color(int(values[0]), int(values[1]), int(values[2]));

          colors[i] = c;

          first = false;
        } else {
          String[] coordinates = split(line, ", ");
          float x = float(coordinates[0]);
          float y = float(coordinates[1]);

          fileVectors.add(new PVector(x, y));
        }
      }
      reader.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }

    curveVectors.add(fileVectors);
  }
}

void mouseReleased() {
  if (output != null) {
    output.flush();
    output.close();
    exit();
  }
}
