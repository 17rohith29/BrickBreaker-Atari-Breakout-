class ball {
  float x;
  float y;
  float diameter;
  float xspeed;
  float yspeed; 
  int gameOver=0;

  ball()
  {
    x=960;
    y=700;
    diameter=40;
    xspeed=5;
    yspeed=5;
  }
  void create()
  {

    fill(255);
    ellipse(x, y, diameter, diameter);
  }

  void move()
  {
    x+=xspeed;
    y+=yspeed;

    if (x>=width-diameter/2 || x<=0+diameter/2) xspeed=-xspeed;
    if (y<=0+diameter/2) yspeed=-yspeed;
    if (y>=height-diameter/2) gameOver++;
  }

  void reset() {
    x=960;
    y=700;
    xspeed=5;
    yspeed=5;
  }
}