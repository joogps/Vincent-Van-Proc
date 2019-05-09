class Walker {
  ArrayList<PVector> vectors;

  float start;
  float end;
  
  color c;
  float speed;
  PVector offset;

  Walker(int i) {
    vectors =  curveVectors.get(i);

    start = random(1);
    end = start+random(0.1, 0.5);
    
    c = colors[i];
    float cOff = random(-25, 100);
    c = color(red(c)+cOff, green(c)+cOff, blue(c)+cOff);
    
    speed = random(0.05, 0.2);
    
    offset = PVector.random2D().mult(2.5);
  }

  void display() {
    pushMatrix();
    translate(offset.x, offset.y);

    int s = floor(start*vectors.size());
    int e = floor(end*vectors.size());

    for (int i = s; i < e-1; i++) {
      PVector v = vectors.get(i%vectors.size());
      PVector nextV = vectors.get((i+1)%vectors.size());

      if (i%(vectors.size()) == vectors.size()-1)
        nextV = v;
      
      stroke(c);
      line(v.x*width, v.y*height, nextV.x*width, nextV.y*height);
    }
    popMatrix();
  }

  void update() {
    start+= speed;
    end+= speed;
  }
}
