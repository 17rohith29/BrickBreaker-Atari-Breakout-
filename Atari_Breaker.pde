/*NOTE this file includes sound(using minim). (YOU NEED TO INSTALL IT TO GET CODE WORKING) 
To install it in WINDOWS(Probably similar for mac) go to sketch->importlibrary->add new library->under libraries type minim and install it.*/


/*This project includes music from mario and Nintendo and full credit of the music goes to them
 ( gather coin music
 mario jump music
 death of mario
 )
 The audio Hurrah music is a popular sound clip and was not created by me. Credit goes to whoever created it.
 */

PImage l1, l2, l3, gameOver, youWon;//this block of code to get image and sound set up
import ddf.minim.*;
Minim minim;
AudioPlayer p1, p2, p3, p4;


ball b=new ball();// creates the ball, paddle and the bricks(which i call breaker)
paddle p =new paddle();
breaker[] array=new breaker[105];

int k=-1;// creates dependancies which will be used in the program 
int lifeLeft=3;
int blockKill=0;


void setup()
{
  minim=new Minim(this);//linking sound files
  p1=minim.loadFile("smb_coin.wav");
  p2=minim.loadFile("smb_jumpsmall.wav");
  p3=minim.loadFile("smb_mariodie.wav");
  p4=minim.loadFile("win.wav");

  l1=loadImage("1.png");//linking images
  l2=loadImage("2.png");
  l3=loadImage("3.png");
  gameOver=loadImage("gameover.png");
  youWon=loadImage("uwon.png");

  size(1920, 1080);
  for (int i=0; i<105; i++)//to create bricks on screen
  { 
    int m=i%15;
    if (i%15==0) k++;
    array[i]=new breaker(128*m, 80*k);
  }
}


void draw ()

{
  if (lifeLeft>0) {
    background (0);   
    if (lifeLeft==1)image(l1, 1600, 900, 364, 100); 
    if (lifeLeft==2)image(l2, 1600, 900, 364, 100);
    if (lifeLeft==3)image(l3, 1600, 900, 364, 100);
    b.create();
    b.move();
    p.create();
    touchBallPaddle(p, b);
    for (int i=0; i<105; i++) array[i].create();
    for (int i=0; i<105; i++) touchBallBreaker(array[i], b);
    if (blockKill==105) {
      image(youWon, 0, 0);
      p4.rewind();
      p4.play();
      noLoop();
    }


    if (b.gameOver>0)
    {
      lifeLeft=lifeLeft-b.gameOver;
      blockKill=0;
      delay(200);
      b.reset();
      p.reset();
      for (int i=0; i<105; i++) array[i].reset();
      b.gameOver--;
    }
  }
  if (lifeLeft==0) {
    image(gameOver, 0, 0);
    p3.rewind();
    p3.play();
    noLoop();
  }
}

void keyPressed()
{
  if (keyCode==RIGHT)
  { 
    if (p.x+p.breadth<width)
    { 
      p.x+=p.paddleSpeed;
    }
  }

  if (keyCode==LEFT)
  { 
    if (p.x>0) {
      p.x-=p.paddleSpeed;
    }
  }
}

void touchBallPaddle(paddle p, ball b)
{
  if (((b.y+b.diameter/2)>=p.y)&&(b.x>=p.x&&b.x<=p.x+400)) {

    b.yspeed=-5;
    p2.rewind();
    p2.play();
  }
  for (float i=p.y; i<height; i++) {
    if (dist(p.x, i, b.x, b.y)<=b.diameter/2) {
      if (b.xspeed==5) b.xspeed=-5;
      if (b.xspeed==-5) b.xspeed=5;
    };
    if (dist(p.x+p.breadth, i, b.x, b.y)<=b.diameter/2) {
      if (b.xspeed==5) b.xspeed=-5;
      if (b.xspeed==-5) b.xspeed=5;
    }
  }
}

void touchBallBreaker(breaker B, ball b)
{

  for (float j=B.y; j<=B.y+B.tall; j++) {
    if (dist(B.x, j, b.x, b.y)<=b.diameter/2||dist(B.x+B.breadth, j, b.x, b.y)<=b.diameter/2) {
      B.close();
      blockKill++;
      p1.rewind();
      p1.play();
      b.xspeed=-b.xspeed;
    }
  }
  for (float i=B.x; i<=B.x+B.breadth; i++) {
    if (dist(i, B.y, b.x, b.y)<=b.diameter/2||dist(i, B.y+B.tall, b.x, b.y)<=b.diameter/2) {
      B.close();      
      blockKill++;
      p1.rewind();
      p1.play();
      b.yspeed=-b.yspeed;
    }
  }
}

//below code is for easy debugging. It lets u win.
/* 
 void mousePressed()
 {
 blockKill=105;
 }
 */