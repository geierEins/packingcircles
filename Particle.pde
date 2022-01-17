class Particle {

  PVector centerVector;
  float pSize, radius, radiusMax, particleGrowthRate;
  int pColRed, pColGreen, pColBlue, alpha;
  int strokeColRed, strokeColGreen, strokeColBlue, strokeAlpha, strokeWeight;
  boolean isCollidedWithOtherParticle;

  Particle(PVector centerVector) {
    this.centerVector = centerVector;
    this.pSize = 0;
    this.radius = pSize/2;
    this.radiusMax=10;
    this.isCollidedWithOtherParticle = false;  
    this.particleGrowthRate = 0.1;
    applyDefaultAppearanceProperties();
  }

  void applyDefaultAppearanceProperties() {
    setColor(255, 255, 255);
    //setColorRandom();
    setAlpha(0);
    //setStrokeColor(255, 255, 255);
    setStrokeColorRandom();
    setStrokeAlpha(200);
    setStrokeWeight(2);
  }

  void runParticle() {
    //updateProperties();
    drawParticle();
    radiusGrowByIfNotCollided(particleGrowthRate);
  }

  void drawParticle() {
    fill(pColRed, pColGreen, pColBlue, alpha);
    stroke(strokeColRed, strokeColGreen, strokeColBlue, strokeAlpha);
    strokeWeight(strokeWeight);
    ellipse(centerVector.x, centerVector.y, pSize, pSize);
  }

  void radiusGrowByIfNotCollided(float growthStep) {
    if (isCollidedWithOtherParticle==false && this.radius <= this.radiusMax) {
      this.radius+=growthStep;
      this.pSize = radius*2;
    }
  }
  
  void updateProperties(){
    pColRed = (int)map(this.radius, 0, 100, 0, 255);
    pColGreen = pColRed;
    pColBlue = pColRed;
  }

  void setXY(int x, int y) {
    this.centerVector.x = x;
    this.centerVector.y = y;
  }

  void setIsCollidedWithParticle(boolean state) {
    this.isCollidedWithOtherParticle = state;
  }

  void setPSize(int pSize) {
    this.pSize = pSize;
    this.radius = pSize/2;
  }

  void setPSizeRandom() {
    this.pSize = (int)random(5, 50);
    this.radius = pSize/2;
  }
  
  void setColor(int r, int g, int b) {
    this.pColRed = r;
    this.pColGreen = g;
    this.pColBlue = b;
  }

  void setColorRandom() {
    this.pColRed = (int)random(0, 255);
    this.pColGreen = (int)random(0, 255);
    this.pColBlue = (int)random(0, 255);
  }

  void setAlpha(int alpha) {
    this.alpha = alpha;
  }

  void setAlphaRandom(int alphaMax) {
    this.alpha = (int)random(40, alphaMax);
  }

  void setStrokeAlpha(int strokeAlpha) {
    this.strokeAlpha = strokeAlpha;
  }

  void setStrokeColorRandom() {
    this.strokeColRed = (int)random(0, 255);
    this.strokeColGreen = (int)random(0, 255);
    this.strokeColBlue = (int)random(0, 255);
  }

  void setStrokeColor(int r, int g, int b) {
    this.strokeColRed = r;
    this.strokeColGreen = g;
    this.strokeColBlue = b;
  }
  
  void setStrokeWeight(int strokeWeight){
    this.strokeWeight = strokeWeight;
  }
}
