class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }


  void addParticle(PVector position) {
    particles.add(new Particle(position));
    Particle p = particles.get(particles.size()-1);
    p.applyForce(PVector.random2D());
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void runParticles() {
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);

      //Runs the particle if alive
      if (p.alive) {
        p.update();
        p.show();
      } else {
        //removes the particle if it is no longer alive
        particles.remove(i);
      }
    }
  }

  void attract() {
    for (Particle p : particles) {
      PVector f = new PVector(0, 0); 

      for (TouchPoint t : points) {
        //Adds the forces from each attraction point together
        f.add(t.attract(p));
      }

      p.applyForce(f);
    }
  }
}