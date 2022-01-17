int bgColRed, bgColGreen, bgColBlue, i;

Button resetButton, saveButton;
ScreenshotHelper screenshotHelper;
ParticleController pc;

void setup() {
  size(1000, 1000);
  frameRate(100);
  bgColRed = 15;
  bgColGreen = 15;
  bgColBlue = 15;
  //bgColRed = (int)random(0, 80);
  //bgColGreen = (int)random(0, 80);
  //bgColBlue = (int)random(0, 80);

  i = 1;

  pc = new ParticleController(2);
  resetButton = new Button(width/2 - 80, height-25, 100, 25, "RESET");
  saveButton = new Button(width/2 + 80, height-25, 100, 25, "SAVE");
  screenshotHelper = new ScreenshotHelper();
}

void draw() {
  background(bgColRed, bgColGreen, bgColBlue);

  // outter circle as border
  //noFill();
  //ellipse(pc.outterCircle.x, pc.outterCircle.y, 2*pc.outterCircleRadius, 2*pc.outterCircleRadius);

  // translate canvas forth and back for spiral view
  if (i%3==0) {
    pc.spawnParticle();
  }
  pc.checkAndRunAll();
  
  i++;


  // buttonsdd
  resetButton.drawButton();
  saveButton.drawButton();
}

void mouseClicked() {
  // RESET
  if (resetButton.mouseIsOverButton()) {
    setup();
  }

  // SAVE
  if (saveButton.mouseIsOverButton()) {
    saveButton.hide();
    resetButton.hide();
    draw();
    screenshotHelper.shot();
    saveButton.retrieve();
    resetButton.retrieve();
  }
}
