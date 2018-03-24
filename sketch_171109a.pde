ArrayList<Particle> particles;
ArrayList<AttractionPoint> attractors;

void setup() {
  size(displayWidth, displayHeight);
  background(51);
  
  particles = new ArrayList<Particle>();
  attractors = new ArrayList<AttractionPoint>();
  
  for (int p = 0; p < 1; p++) {
    particles.add(new Particle());
  }
}

void draw(){
  background(51, 5);
  
  for (int t = 0; t < attractors.size(); t++) {
      AttractionPoint a = attractors.get(t);
      
      a.run(touches[t].x, touches[t].y);
    }
    
    
    for (Particle p : particles) {
      PVector f = new PVector(0, 0);
      
      for (AttractionPoint a : attractors) {
        //Adds the forces from each attraction point together
        f.add(a.attract(p));
        //PVector force = a.attract(p);
        //p.applyForce(force);
      }
      
      p.applyForce(f);
         
      p.show();
      p.update(); 
    }
}

void touchStarted() {
  attractors.add(new AttractionPoint());
}

void touchEnded() {
  attractors.remove(0);
}
