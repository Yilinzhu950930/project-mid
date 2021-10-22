Gun gun;
float bulletSpeed = 4;
ArrayList<Bullet> bullets;
ArrayList<Plane> planes;
PImage image1, image2, image3, bg, shoot;
int frameNumber;
int score = 0;

int x1 = 350;
int y1 = 550;
int x2 = 400;
int y2 = 600;

void setup() {
  size(400,600);
  
  image1 = loadImage("res/a.png");
  image2 = loadImage("res/b.png");
  image3 = loadImage("res/c.png");
  shoot = loadImage("res/shoot.png");
  bg = loadImage("res/bg.jpg");
  bg.resize(width, height);
  
  bullets = new ArrayList<Bullet>();
  planes = new ArrayList<Plane>();
  gun = new Gun(width/2, height);
  
  for(int i=0;i<100;i++) {
    float y = - random(8000)+500;
    float x = random(width-100)+50;
    int type = (int)random(3);
    if(type==0){
      Plane plane = new Plane(x, y, 50,90, image1);
      plane.vy = 3; 
      planes.add(plane);
    }else if(type==1) {
      Plane plane = new Plane(x, y, 40,70, image2);
      plane.vy = 4; 
      planes.add(plane);      
    }else if(type==2) {
      Plane plane = new Plane(x, y, 30,50, image3);
      plane.vy = 5; 
      planes.add(plane);      
    }
  }
  textSize(20);
}

void shoot(Gun gun) {
  float endX = gun.x + gun.length*sin(gun.angle);
  float endY = gun.y - gun.length*cos(gun.angle);
  
  Bullet bullet = new Bullet(endX, endY);
  bullet.vx = bulletSpeed*cos(gun.angle-PI/2);
  bullet.vy = bulletSpeed*sin(gun.angle-PI/2);
  bullets.add(bullet);
}

void draw() {
  background(bg);
  fill(255);
  text("Score: "+score, 20, 20);
  
  image(shoot, x1, y1, x2-x1, y2-y1);
  
  fill(255,255, 0);
  circle(width/2, height, 40);
  gun.draw();

  for(Bullet bullet: new ArrayList<Bullet>(bullets)) {
    bullet.draw();
    for(Plane plane: new ArrayList<Plane>(planes)) {
      if(plane.contains(bullet.x, bullet.y)){
        planes.remove(plane);
        bullets.remove(bullet);
        score++;
      }
    }
    
  }
  for(Plane plane: planes) {
    plane.draw();
  }
  if(mousePressed){
    if(frameNumber%10==0){
      if(mouseX>=x1&&mouseX<=x2&& mouseY>=y1&&mouseY<=y2) {
        shoot(gun);
      }
    }
  }
  
  frameNumber++;
}
