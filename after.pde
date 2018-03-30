ArrayList<ParticleSystem> systems;
ArrayList<TouchPoint> points;
int fingers;

ParticleSystem latestSystem;
TouchPoint latestTouch;

void setup() {
  size(displayWidth, displayHeight);
  background(0);

  systems = new ArrayList<ParticleSystem>();
  points = new ArrayList<TouchPoint>();
}


void draw() {
  background(0);

  fingers = points.size();


  //Run all touch points - must happen every frame
  for (int t = 0; t < points.size(); t++) {
    TouchPoint a = points.get(t); 

    PVector position = new PVector(touches[t].x, touches[t].y);

    a.run(position);
  }

  switch (fingers) {
  case 1 :
    latestSystem.addParticle(latestTouch.location);

    //latestSystem.attract();
    break;

  case 2 :
    for (int i = 0; i < fingers; i++) {
      ParticleSystem system = systems.get(i);
      system.addParticle(points.get(i).location);
      //system.attract();
    }
    latestSystem.attract();

    break;
  }


  for (ParticleSystem system : systems) {   
    system.runParticles();
  }
}


void touchStarted() {
  systems.add(new ParticleSystem());
  points.add(new TouchPoint());
  latestSystem = systems.get(systems.size()-1);
  latestTouch = points.get(points.size()-1);
}

void touchEnded() {
  points.remove(0);
}