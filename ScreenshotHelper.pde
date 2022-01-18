class ScreenshotHelper{

  String format = ".png";
  
  void shot(){
    save("screenshots/"+dateAsFilename() + format);
  }
  
  String dateAsFilename(){
    return year() + "-" + month() + "-" + day() + "_" + hour() + "-" + minute() + "-" + second();
  }
  
}
