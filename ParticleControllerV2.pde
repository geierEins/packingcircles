class ParticleController { //<>//

  ArrayList<Particle> particles;
  PVector outterCircle, nextCandidate;
  int pCount, pSize;
  int outterCircleRadius;

  ParticleController() {
    outterCircle = new PVector(width/2, height/2);
    outterCircleRadius = (int)(width*0.45);
    // create particle arraylist to store particles
    particles = new ArrayList<>();
  }

  void spawnParticle() {
    boolean foundCandidate = false;
    PVector nextCandidate;
    while (foundCandidate==false) {
      nextCandidate = new PVector((int)random(0, width), (int)random(0, height));
      
      // first condidtion: be spawned inside of outter circle
      if ((sq(nextCandidate.x-outterCircle.x)+sq(nextCandidate.y-outterCircle.y)) <= sq(outterCircleRadius)) {
        if (particles.size()==0) {
          foundCandidate = true; //<>//
          particles.add(new Particle(nextCandidate, outterCircle));
        }
        if (foundCandidate) break;

        // second condition: be spawned otside of other particle/circle
        if (particles.size()>0) {
          for (Particle pToCheck : particles) {
            if (sq(nextCandidate.x-pToCheck.centerVector.x)+sq(nextCandidate.y-pToCheck.centerVector.y) > sq(pToCheck.radius)) { //<>//
              foundCandidate = true;
              particles.add(new Particle(nextCandidate, outterCircle));
              println("added a new particle to particles. size is now: " + particles.size());
            }
            if (foundCandidate) break;
          }
        }
      }
    }
  }

  void checkAndRunAll() {
    checkAndSetEachParticlesCollisionState();
    runParticles();
  }

  void runParticles() {
    for (Particle p : particles) {
      p.runParticle();
    }
  }

  void checkAndSetEachParticlesCollisionState() {
    for (int i = 0; i < particles.size(); i++) {
      // first condition: collision with outter circle
      if ((PVector.dist(particles.get(i).centerVector, outterCircle) + particles.get(i).radius) >= outterCircleRadius) {
        particles.get(i).setIsCollidedWithParticle(true);
        //println("particles.get("+i+") collided with the outter circle!");
      }
      for (int j = 0; j < particles.size(); j++) {
        if (i!=j) {
          if (
            // second condition: collision with any other particle
            PVector.dist(particles.get(i).centerVector, particles.get(j).centerVector) <=
            (particles.get(i).radius + particles.get(j).radius)
            ) {
            particles.get(i).setIsCollidedWithParticle(true);
            particles.get(j).setIsCollidedWithParticle(true);
            //println("particles.get("+i+") collided with particles.get("+j+")!");
            break;
          }
        }
      }
    }
  }
}
