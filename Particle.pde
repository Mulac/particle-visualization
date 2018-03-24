class Particle {
  
  PVector velocity;
  PVector location;
  PVector acceleration;
  float topSpeed, mass, v1, v2, v3, damp;
  
  Particle(){ 
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed = 10;
    mass = random(1, 20);
    v1 = random(1, 255);
    v2 = random(1, 255);
    v3 = random(1, 255);
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    acceleration.add(f);
  }
  
  void update(){
    //mouse = new PVector(mouseX, mouseY);
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
      
       
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
    stroke(v1, v2, v3);
    strokeWeight(mass);
    
    point(location.x, location.y);
  }
}