class Button {

  int x, y, buttonWidth, buttonHeight;
  String message;

  Button(int x, int y, int buttonWidth, int buttonHeight, String message) {
    this.x = x;
    this.y = y;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.message = message;
  }

  void drawButton() {
    //rect
    if (mouseIsOverButton()) {
      fill(90);
    } else {
      fill(30);
    }
    strokeWeight(1);
    stroke(255);
    rectMode(CENTER);
    rect(x, y, buttonWidth, buttonHeight);
    
    //text
    fill(200);
    textAlign(CENTER);
    text(message, x, y+3);
  }

  boolean mouseIsOverButton() {
    if (mouseX >(x-(buttonWidth/2)) &&
      mouseX < (x+(buttonWidth/2)) &&
      mouseY > (y-(buttonHeight/2)) &&
      mouseY < (y+(buttonHeight/2))) {
      return true;
    } else {
      return false;
    }
  }
  
  void hide(){
    this.y *=2;
  }
  
  void retrieve(){
    this.y/=2;
  }
}
