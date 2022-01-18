int bgColRed, bgColGreen, bgColBlue, counter, spawnEveryNframes;

Button resetButton, saveButton, speedupButton, spawnNButton, slowdownButton;
ScreenshotHelper screenshotHelper;
ParticleController pc;

void setup() {
  size(1000, 1000);
  frameRate(100);
  bgColRed = 15;
  bgColGreen = 15;
  bgColBlue = 15;

  counter = 0;
  spawnEveryNframes = 100;

  pc = new ParticleController();
  resetButton = new Button((int)(width*0.1667), height-25, 100, 25, "RESET");
  saveButton = new Button((int)(width*5*0.1667), height-25, 100, 25, "SAVE");
  slowdownButton = new Button((int)(width*4*0.1667), height-25, 100, 25, "SLOW DOWN");
  speedupButton = new Button((int)(width*3*0.1667), height-25, 100, 25, "SPEED UP");
  spawnNButton = new Button((int)(width*2*0.1667), height-25, 100, 25, "SPAWN 10");

  screenshotHelper = new ScreenshotHelper();
}

void draw() {
  background(bgColRed, bgColGreen, bgColBlue);

  if (counter%spawnEveryNframes==0) {
    pc.spawnParticle();
  }
  pc.checkAndRunAll();
  counter++;

  // buttons
  resetButton.drawButton();
  saveButton.drawButton();
  speedupButton.drawButton();
  slowdownButton.drawButton();
  spawnNButton.drawButton();
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
    speedupButton.hide();
    slowdownButton.hide();
    spawnNButton.hide();

    draw();
    screenshotHelper.shot();

    saveButton.retrieve();
    resetButton.retrieve();
    speedupButton.retrieve();
    slowdownButton.retrieve();
    spawnNButton.retrieve();
  }
  // SPEED UP
  if (speedupButton.mouseIsOverButton()) {
    if (spawnEveryNframes>=6) {
      spawnEveryNframes-=5;
      println("spawnEveryNframes: " + spawnEveryNframes);
    }
  }
  // SPAWN 10
  if (spawnNButton.mouseIsOverButton()) {
    for (int i = 0; i < 10; i++) {
      pc.spawnParticle();
    }
  }
  // SLOW DOWN
  if (slowdownButton.mouseIsOverButton()) {
    if (spawnEveryNframes<=145) {
      spawnEveryNframes+=5;
      println("spawnEveryNframes: " + spawnEveryNframes);
    }
  }
  pc.spawnParticleWithGivenXYifValid(mouseX, mouseY);
}
