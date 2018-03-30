class Particle {

  float topSpeed, mass, lifespan;
  PVector velocity;
  PVector location;
  PVector acceleration;
  boolean alive;
  
  Particle(PVector p){ 
    alive = true;
    
    location = p;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed = 10;
    lifespan = 255;
    mass = 45;
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    acceleration.add(f);
  }
  
  void update(){
    if (lifespan <= 0){
      alive = false;  
    }
    lifespan -= 1;
    
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    
    location.add(velocity);
      
       
    // Reversing direction of the particles at screen edges   
    if (location.x > displayWidth || location.x < 0) {
      velocity.x *= -1;
      location.add(velocity);
    }
    else if (location.y > displayHeight+130 || location.y < 0) {
      velocity.y *= -1;
      location.add(velocity);
    }
    else {
      location.add(velocity);
    }
    
    acceleration.mult(0);
  }
  
  void show() {
    
    for (int i = 0; i < 5; i++){
      stroke(61, 149, 255, lifespan - i * 40);
      strokeWeight(mass * 0.2 * i + 1);
      point(location.x, location.y);
    }
  }
}