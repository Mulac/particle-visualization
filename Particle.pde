class Particle {
  
  PVector velocity;
  PVector location;
  PVector acceleration;
  PVector mouse;
  PVector project;
  PVector dist;
  float topSpeed, mass, h, v1, v2, v3, lifespan, colour, inc, aging;
  boolean alive;
  
  Particle(PVector p, float a){ 
    alive = true;
    
    location = p;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed = 10;
    lifespan = 255;
    aging = a;
    inc = 0.1;
    mass = random(1, 40);
    
    v1 = random(1, 255);
    v2 = random(1, 255);
    v3 = random(1, 255);
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    acceleration.add(f);
  }
  
  void update(){   
    //checks if
    if (lifespan <= 0){
      alive = false;  
    }
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    
    //Aging the particle
    lifespan -= aging;
      
       
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
    //float c = velocity.magSq();
    stroke(51, 169, 255, lifespan);
    strokeWeight(mass);    
    
    point(location.x, location.y);
  }
}