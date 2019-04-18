class Ball{
PVector position;
int ballSize=25;
PVector acceleration;
Game game;

Ball(Game game){
this.game=game;
position= new PVector(width/2,height/2);
acceleration = new PVector();
ballImage.resize(ballSize,ballSize);
}



void ballDraw(){
 imageMode(CENTER);
fill(255,255,255);
ellipse(position.x,position.y,ballSize,ballSize);
image(ballImage,position.x,position.y);
imageMode(0);
}

void push(PVector direction){
actionsee(direction);
direction.normalize();
acceleration.add(direction);
}

void pass(PVector direction){
actionsee(direction);
direction.normalize();
direction.mult(15);
acceleration.add(direction);
}

void logic(){
if(position.x<0){
position= new PVector(width/2,height/2);
game.blue.fitness+=100;
game.red.fitness-=100;
acceleration.mult(0);
}
if(position.x>width){
position= new PVector(width/2,height/2);
game.red.fitness+=100;
game.blue.fitness-=100;
acceleration.mult(0);
}
if(position.y>height)
position= new PVector(width/2,height/2);
if(position.y<0)
position= new PVector(width/2,height/2);
position.add(acceleration);
acceleration.mult(0.9);
}


void actionsee(PVector see){
   if(game.invisible){
//line(position.x,position.y,position.x+see.x,position.y+see.y);
fill(255);
strokeWeight(3);
noFill();
ellipse(position.x,position.y,25,25);
strokeWeight(1);
stroke(0);
   }
}







}
