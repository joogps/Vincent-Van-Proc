String[] curves = {"curve1.txt", "curve2.txt"};
color[] colors = new color[curves.length];

ArrayList<ArrayList<PVector>> curveVectors = new ArrayList<ArrayList<PVector>>();

Walker[] walkers;

void setup() {
  size(640, 360);

  parseFiles(curves);
  walkers = new Walker[10];
  for (int i = 0; i < walkers.length; i++)
    walkers[i] = new Walker(floor(random(curveVectors.size())));
}

void draw() {
  background(10);

  for (int i = 0; i < walkers.length; i++) {
    walkers[i].update();
    walkers[i].display();
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
