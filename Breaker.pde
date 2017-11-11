class breaker {
  float x ;
  float y;
  float breadth;
  float tall;
  float initialA;
  float initialB;


  breaker (float a, float b)
  {
    x=a;
    initialA=a;
    y=b;
    initialB=b;
    tall=80;
    breadth=128;
  }


  void create() {  
    if ((int)y/80==0) fill(255, 0, 0);
    if ((int)y/80==1) fill(0, 255, 0);
    if ((int)y/80==2) fill(255, 105, 180);
    if ((int)y/80==3) fill(255, 255, 0);
    if ((int)y/80==4) fill(160, 32, 240);
    if ((int)y/80==5) fill(255, 165, 0);
    if ((int)y/80==6) fill(233, 150, 122);

    rect(x, y, breadth, tall);
  }

  void close() {
    x=-1;
    y=-1;
    tall=0;
    breadth=0;
  }
  void reset()
  {
    x=initialA;
    y=initialB;
    tall=80;
    breadth=128;
  }
}