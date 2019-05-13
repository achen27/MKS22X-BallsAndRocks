interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

interface Collideable{
  boolean isTouching(Thing other);
}

abstract class Thing implements Displayable, Collideable{
  float x, y;//Position of the Thing
  float dx, dy;

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
    this.dx = 0;
    this.dy = 0;
  }
  abstract void display();
  abstract boolean isTouching(Thing other);
  abstract void bounce();
  abstract void changeColor();
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
  
  void bounce(){
    return;
  }
  
  boolean isTouching(Thing other){
    return true;
  }
  
  void changeColor(){
    return;
  }
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y, PImage r) {
    super(x, y, r);
  }
  
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
    }
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
  
  void changeColor(){
    return;
  }

  void display() {
    ellipse(x, y, 50, 50);
    //color c = color(152, 16, 100); //I don't know how to make only the balls colored yet
    //fill(c); //So for now everything's purple :( 
  }
  
  boolean isTouching(Thing other){
    return sqrt((this.x - other.x) * (this.x - other.x) + (this.y - other.y)*(this.y - other.y)) <= 40;
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
  void bounce(){
    dx *= -1;
    dy *= -1;
  }
}

class Smallball extends Ball{
  Smallball(float x, float y){
    super(x,y);
    float r = random(5) + 5;
    float theta = random(TWO_PI);
    dx = r * cos(theta);
    dy = r * sin(theta);
  }
  void display() {
    ellipse(x, y, 25, 25);
    color c = color(152, 16, 100); //I don't know how to make only the balls colored yet
    fill(c); //So for now everything's purple :( 
  }
  void changeColor(){
    ellipse(x,y,50,50);
    fill(0, 126, 255);
  }
}

class Bigball extends Ball{
  Bigball(float x, float y){
    super(x,y);
  }
  void display() {
    ellipse(x, y, 50, 50);
    color c = color(255, 204, 0); //I don't know how to make only the balls colored yet
    fill(c); //So for now everything's purple :( 
  }
  
  void changeColor(){
    ellipse(x, y, 50, 50);
    fill(0,255,0);
    
    
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Collideable> listOfCollideables;

void setup() {
  size(1000, 800);
  PImage rock;
  //rock = loadImage("rock1.jpg");
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  listOfCollideables = new ArrayList<Collideable>();
  for (int i = 0; i < 5; i++) {
    Smallball b = new Smallball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    listOfCollideables.add(b);
    if(Math.random() > .5){
      rock = loadImage("rock1.jpg");
      Rock r = new Rock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(r);
      listOfCollideables.add(r);
    } else {
      rock = loadImage("rock2.png");
      Rock r = new Rock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(r);
      listOfCollideables.add(r);
    }
  }
  for (int i = 0; i < 5; i++) {
    Bigball b = new Bigball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    listOfCollideables.add(b);
    if(Math.random() > .5){
      rock = loadImage("rock1.jpg");
      Rock r = new Rock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(r);
      listOfCollideables.add(r);
    } else {
      rock = loadImage("rock2.png");
      Rock r = new Rock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(r);
      listOfCollideables.add(r);
    }
  }
  for (int i = 0; i < 3; i++) {
    if(Math.random() > .5){
      rock = loadImage("rock1.jpg");
      LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(m);
      thingsToMove.add(m);
      listOfCollideables.add(m);
    } else {
      rock = loadImage("rock2.png");
      LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100),rock);
      thingsToDisplay.add(m);
      thingsToMove.add(m);
      listOfCollideables.add(m);
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
    for( Collideable c : listOfCollideables) {
     if ( c.isTouching((Thing) thing) && !c.equals(thing)){
        ((Thing) c).bounce();
        ((Thing) c).changeColor();
      }
    }
  }
  
  
}
