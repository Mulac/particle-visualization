ParticleSystem system;
Button settings;

void setup() {
  size(displayWidth, displayHeight);
  
  system = new ParticleSystem();
  
  for (int p = 0; p < 500; p++) {
    system.addParticle();
  }
}

void draw(){
  background(51);
  
  system.run();
}

void touchStarted() {
  system.addAttractor();
}

void touchEnded() {
  system.removeAttractor();
}
  