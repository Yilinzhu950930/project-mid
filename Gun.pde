class Gun {
  float angle;
  float length = 50;
  float x;
  float y;
  int frameNum;
  
  Gun(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    stroke(255,0,0);
    strokeWeight(4);
    float endX = x + length*sin(angle);
    float endY = y - length*cos(angle);
    line(x, y, endX, endY);
    int v = frameNum%360;
    v = v - 180;
    if(v>0){
      angle = v/180.0*PI-PI/2;
    }else{
      angle = -v/180.0*PI-PI/2;
    }
    
    frameNum++;
  }
}
