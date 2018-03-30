class TouchPoint {
  
  float G, d, mass;
  PVector location;
  
  TouchPoint() {
    mass = 50;
    G = 25.67;
  }
  
  
  PVector attract(Particle p) {
    //Finding the direction of the force
    PVector force = PVector.sub(location, p.location);
    float d = force.magSq();
    
    d = constrain(d, 0.01, 15);
    
    force.normalize();
    
    //Calculation the magnitude
    float strength = (G * mass * p.mass) / (d*d*d);
    
    //Putting magnitude and direction together
    force.mult(strength);
    return force;
  }
  
  void run(PVector p) {
    stroke(255, 0, 0);
    strokeWeight(6);
    location = p;
    point(location.x, location.y);
  }
  
}