ArrayList<Particle> particles;

void setup() {
  size(400, 400);
  
  particles = new ArrayList<Particle>();
  
  //CREATE a new particle
  for (int p = 0; p < 10; p++) {
    particles.add(new Particle());
  }
}

void draw() {
  //SHOW the particle
  for(Particle p : particles){
    p.show();
  }
}