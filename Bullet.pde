class Bullet {
  float x;
  float y;
  float vx;
  float vy;
 
  Bullet(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    fill(255,0,0);
    circle(x, y, 10);
    x+=vx;
    y+=vy;
  }
}
