import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioInput input;
// FFT fft;
Ball[] balls;
int num; // number of balls

void setup()
{
    // size(700, 450, P3D);
    // frame.setResizable(true);
    fullScreen();
    noCursor();
    noStroke();
    colorMode(HSB, 360,100,500);

    num = 300;

    minim = new Minim(this);
    input = minim.getLineIn(Minim.STEREO, 2048);
    // fft = new FFT(input.bufferSize(), input.sampleRate());

    balls = new Ball[num];
    balls[0] = new Ball(35, width/2, height/2, 1,0);
    // initialize invisible bullshit
    for(int i=1; i<balls.length; i++){
        balls[i] = new Ball(35, width/2, height/2 ,1,0);
    }
}

void draw()
{
    background(0);
    // fft.forward(input.mix);
    // calculate level
    float level = 0;
    for(int i=0; i<input.bufferSize(); i++){
        level += input.mix.get(i);
    }
    level = level/input.bufferSize();
    float speed = abs(level)*600;
    // shift the balls but keep 0th and create new 1st
    for(int i=balls.length-1; i>1; i--){
        balls[i] = balls[i-1];
    }
    // create deepcopy of 0 because balls[i] refers to pointers
    balls[1] = new Ball(35, balls[0].x, balls[0].y, balls[0].v.x, balls[0].v.y);
    balls[1].c = balls[0].c;
    // now move the balls
    for(int i=balls.length-1; i>0; i--){
        balls[i].move(0.8);
        balls[i].display();
    }
    balls[0].randomMove(random(-0.5,0.5), speed);
    balls[0].display();
}

void stop()
{
    // always close Minim audio classes when you finish with them
    input.close();
    minim.stop();

    super.stop();
}

class Ball {
    float r;
    float x, y;
    PVector v;
    color c;
    int alpha; // transparency / saturation
    Ball(float rr, float xx, float yy, float dx, float dy){
        r = rr;
        x = xx;
        y = yy;
        v = new PVector(dx,dy);
        c = 0; // color in hsb °
        alpha = 500;
    }

    void display(){
        fill(c, 85,alpha);
        ellipse(x,y, r,r);
    }

    void randomMove(float angle, float speed){
        v = v.rotate(angle);
        PVector velocity = PVector.mult(v, speed);
        // dont leave screen
        if(x+velocity.x<0 || x+velocity.x>width){
            velocity.x = -velocity.x;
            v.x = -v.x;
        }
        if(y+velocity.y<0 || y+velocity.y>height){
            velocity.y = -velocity.y;
            v.y = -v.y;
        }
        x = x+velocity.x;
        y = y+velocity.y;
        // change color
        c = (c+1)%360;
    }

    void move(float speed){
        // same thing as randomMove but without rotation
        PVector velocity = PVector.mult(v, speed);
        x = x+velocity.x;
        y = y+velocity.y;
        // set alpha to zero in num steps and grow slowly
        alpha -= 500.0/num;
        r += 0.3;
    }
}
