class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float angle;
  float aVelocity;
  float aAcceleration;
  
  float mass;
  float lifespan;
  color bodyColor;
  
  Mover(PVector l)
  {
    location = l.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    angle = 0;
    aVelocity = 0;
    aAcceleration = 0;
    
    mass = 5;
    lifespan = 255;
    bodyColor = color(random(64), random(64), random(64));
  }
  
  void run()
  {
    update();
    display();
  }
  
  void appyForce(PVector force)
  {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
    
    aAcceleration = f.x;
    aAcceleration = f.y;
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    aVelocity += aAcceleration;
    angle += aVelocity;
    aAcceleration = 0;
    
    lifespan -= 3;
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle));
    rectMode(CENTER);
    // stroke(255);
    fill(bodyColor, lifespan * 2);
    ellipse(0, 0, mass * 20, mass * 20);
    popMatrix();
  }
  
  boolean isDead()
  {
    if(lifespan < 0)
    {
      return true;
    }
    return false;
  }
}