//ParticleSystem system;
ArrayList<Particle> particles;
ArrayList<Touch> touchPoints;
int fingers;

void setup() {
  size(displayWidth, displayHeight);
  background(0);

  //system = new ParticleSystem();
  particles = new ArrayList<Particle>();
  touchPoints = new ArrayList<Touch>();
}

void draw() {
  background(0, 50);

  fingers = touchPoints.size();
  println(fingers);

  switch(fingers) {
  case 1 :
  case 2 :
    spawn1();
    break;
  case 3 :
    gravitation();
    break;
  }

  runParticles();
  //system.run();
}

void runParticles() {
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);

    if (p.alive) {
      p.show();
      p.update();
    } else {
      particles.remove(i);
    }
  }
}

void touchStarted() {
  touchPoints.add(new Touch());
}

void touchEnded() {
  touchPoints.remove(0);
}



PVector applyDrag(Particle p) {
  float speed = p.velocity.magSq();
  float strength = 0.05 * speed * speed * speed * speed * p.mass;

  PVector dragForce = p.velocity;
  dragForce.normalize();

  dragForce.mult(-strength);

  return dragForce;
}

void spawn1() {
  for (int t = 0; t < touchPoints.size(); t++) {
    //FINDS the position of the touch
    PVector position = new PVector(touches[t].x, touches[t].y);

    //ADDS a particle at the attractors position
    particles.add(new Particle(position, 10));

    //APPLYS a large force away from the attractor
    particles.get(particles.size()-1).applyForce(PVector.random2D().mult(3));
  }
}

void gravitation() {
  for (int t = 0; t < touchPoints.size(); t++) {
    Touch a = touchPoints.get(t);

    //FINDS the position of the touch
    PVector position = new PVector(touches[t].x, touches[t].y);

    //RUNS the attractor
    a.run(position);
    //ADDS a particle at the attractors position
    particles.add(new Particle(position, 0.2));

    //APPLYS a large force away from the attractor
    particles.get(particles.size()-1).applyForce(PVector.random2D().mult(50));
  }


  for (Particle p : particles) {
    PVector f = new PVector(0, 0);

    for (Touch a : touchPoints) {
      //Adds the forces from each attraction point together
      f.add(a.attract(p));
    }

    p.applyForce(f);
  }
}