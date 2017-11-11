class paddle 
{
  float x;
  float y;
  float breadth;
  float tall;
  float paddleSpeed;

  paddle() {
    tall=20;
    x=760;
    y=1060;
    breadth=400;
    paddleSpeed=30;
  }

  void create() {
    fill(255, 0, 0);
    rect(x, y, breadth, tall);
  }

  void reset()
  {
    x=760;
    y=1060;
  }
}