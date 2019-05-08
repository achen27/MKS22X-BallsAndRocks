interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}


class Rock extends Thing {
  
  PImage rock;
  float dx;
  float dy;
  int mass;
  
  Rock(float x, float y, PImage r) {
    super(x, y);
    rock = r;
    float ra = random(5);
    float theta = random(TWO_PI);
    dx = ra * cos(theta);
    dy = ra * sin(theta);
  }

  void display() {
    image(rock,x,y,50,30);
  }
}

public class LivingRock extends Rock implements Moveable {
  float t = 0;
  LivingRock(float x, float y, PImage r) {
    super(x, y, r);
  }
<<<<<<< HEAD
  void move() {/*
=======
  
  void display() {
    super.display();
    ellipse(x+5,y+5,10,10);
    ellipse(x+25,y+5,10,10);
    fill(0);
    ellipse(x+5,y+5,5,5);
    ellipse(x+25,y+5,5,5);
    fill(255);
  }
  
  void move() {
>>>>>>> 356210c0d77b7ac3209940c4482a6e4f195fb123
    if (Math.random() > 0.5){
      double xchange = Math.random();
      if (x + xchange < 1000 && x + xchange > 0){
        x += xchange;
      }  
    }
    else{
      double xchange = Math.random();
      if (x - xchange < 1000 && x - xchange > 0){
        x -= xchange;
      }  
    }
    if (Math.random() > 0.5){
      double ychange = Math.random();
      if (y + ychange < 1000 && y + ychange > 0){
        y += ychange;
      }
    }
    else{
      double ychange = Math.random();
      if (y - ychange < 1000 && y - ychange > 0){
        y -= ychange;
      }
    }  */
    if (x + Math.cos(t) < 950 && x + Math.cos(t) > 50){  
      x += 1 * Math.cos(t);
    } 
    if (y + 1 * Math.sin(t) < 750 && y + Math.sin(t) > 50){
      y += 1 * Math.sin(t);
    }
    t += 0.01;
  }
}

class Ball extends Thing implements Moveable {
  float dx;
  float dy;
  Ball(float x, float y) {
  
    super(x, y);
    float r = random(5);
    float theta = random(TWO_PI);
    dx = r * cos(theta);
    dy = r * sin(theta);
  }

  void display() {
    ellipse(x, y, 50, 50);
    //color c = color(152, 16, 100); //I don't know how to make only the balls colored yet
    //fill(c); //So for now everything's purple :( 
  }

  void move() {
    /* ONE PERSON WRITE THIS */
    x += dx;
    y += dy;
    if(x > 1000){
      x = 1000;
      dx = -dx; 
    }
    if(y > 800){
      y = 800;
      dy = -dy;
    }
    if(x < 0){
      x = 0;
      dx = -dx;
    }
    if(y < 0){
      y = 0;
      dy = -dy;
    }
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);
  PImage rock;
  //rock = loadImage("rock1.jpg");
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    if(Math.random() > .5){
      rock = loadImage("rock1.jpg");
      Rock r = new Rock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(r);
    } else {
      rock = loadImage("rock2.png");
      Rock r = new Rock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(r);
    }
  }
  for (int i = 0; i < 3; i++) {
    if(Math.random() > .5){
      rock = loadImage("rock1.jpg");
      LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(m);
      thingsToMove.add(m);
    } else {
      rock = loadImage("rock2.png");
      LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(m);
      thingsToMove.add(m);
    }
  }
}
void draw() {
  background(255);

  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}