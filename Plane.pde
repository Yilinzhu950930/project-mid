class Plane{
  float x;
  float y;
  float width;
  float height;
  float vx;
  float vy;
  PImage image;
  
  Plane(float x, float y, float width, float height, PImage image) {
    this.image = image;
    this.x = x;
    this.y= y;
    this.width = width;
    this.height = height;
  }
  
  void draw() {
    image(image,x-width/2, y-height/2, width, height);
    x += vx;
    y += vy;
  }
  
  boolean contains(float xx, float yy) {
    if(xx>=x-width/2&&xx<x+width/2&&yy>y-height/2&&yy<y+height/2){
      return true;
    }
    return false;
  }
}
