class Players{
Team team;
PVector position;
static final int playerSize=15;
PVector direction;
PVector acceleration;
String name;
static final int maxEnergy=300;
int energy;
boolean hasBall;
Players nearest;
Players farest;
String state;
int teamNumber;
Coach leCoachDelequipe;
Game game;


Players(Coach leCoachDelequipe,int theteam,Game game){
  this.leCoachDelequipe=leCoachDelequipe;
  this.game=game;
teamNumber=theteam;
team=new Team(theteam);
position=team.positionInit();
direction=new PVector();
acceleration=new PVector();
name=new Name().nom();
energy=maxEnergy;
nearest=null;
farest=null;
state="pause";
}

void Playerdraw(){
fill(0);
textSize(10);
//text(state,position.x,position.y-20);
fill(team.teamColor);
ellipse(position.x,position.y,playerSize,playerSize);
if(mouseX<position.x+playerSize/2&&mouseX>position.x-playerSize/2)
if(mouseY<position.y+playerSize/2&&mouseY>position.y-playerSize/2){
 fill(0,50); 
//rect(position.x-50,position.y-50,100,100);
 fill(team.teamColor); 
text("Name: "+name,position.x-45,position.y-40);
text("State: "+state,position.x-45,position.y-30);
text("Energy Level: "+energy,position.x-45,position.y-20);
text("Near: "+nearest.name,position.x-45,position.y-10);
text("Far: "+farest.name,position.x-45,position.y);
}
}

void nearestPlayer(){
  Players leMin=null;
PVector reponse=new PVector();
PVector min=new PVector(9999,9999);
for(Players t:game.team1){
if(t != this){
PVector.sub(t.position,position,reponse);
if(reponse.mag()<=min.mag()){
  min.setMag(reponse.mag());
  leMin=t;
}
}
}
for(Players t:game.team2){
if(t != this){
PVector.sub(t.position,position,reponse);
if(reponse.mag()<=min.mag()){
  min.setMag(reponse.mag());
  leMin=t;
}
}
}
nearest=leMin;
}

void farestPlayer(){
  Players leMax=null;
PVector reponse=new PVector();
PVector max=new PVector(-9,-9);
for(Players t:game.team1){
if(t != this){
PVector.sub(t.position,position,reponse);
if(reponse.mag()>=max.mag()){
  max.setMag(reponse.mag());
  leMax=t;
}
}
}
for(Players t:game.team2){
if(t != this){
PVector.sub(t.position,position,reponse);
if(reponse.mag()>=max.mag()){
  max.setMag(reponse.mag());
  leMax=t;
}
}
}
farest=leMax;
}



void Playerlogic(){
  nearestPlayer();
  farestPlayer();
  
if(position.x<0)
position.x=0;
if(position.x>width)
position.x=width;
if(position.y>height)
position.y=height;
if(position.y<0)
position.y=0;

if(dist(position.x,position.y,game.ball.position.x,game.ball.position.y)<=playerSize/2+game.ball.ballSize/2){
game.ball.push(acceleration);
hasBall=true;
leCoachDelequipe.fitness+=5;
}
else
hasBall=false;
position.add(acceleration);
acceleration.mult(0.99);    //epuisement naturelle

switch(state){
case "run":
leCoachDelequipe.fitness+=1/game.teamSize;
energy--;
if(energy<0){
energy=0;
acceleration.mult(0);
leCoachDelequipe.fitness-=5/game.teamSize;
}
break;
case "pause":
leCoachDelequipe.fitness+=1/game.teamSize;
energy++;
if(energy>maxEnergy){
energy=maxEnergy;
leCoachDelequipe.fitness-=1/game.teamSize;
}
break;
case "pass":
break;
}
if(energy>maxEnergy){
energy=maxEnergy;
}
}
//////////////////////////////////////////////////////////////////////////////////
void run(PVector directionTemp){
actionsee(directionTemp);
if(energy>0){
  state="run";
directionTemp.normalize();
directionTemp.mult(12);
acceleration.add(directionTemp);
acceleration = directionTemp;
}
}

void pass(PVector directionTemp){
actionsee(directionTemp);
if(hasBall==true){
state="pass";
game.ball.pass(directionTemp);
leCoachDelequipe.fitness+=100;
}
}

void pause(){
  
 actionsee(new PVector(0,0));
state="pause";
acceleration.mult(0.95);
  
}
/////////////////////////////////////////////////////////////////////////////////////////

void actionsee(PVector see){
  if(game.invisible){
//line(position.x,position.y,position.x+see.x,position.y+see.y);
stroke(team.teamColor);
strokeWeight(3);
noFill();
ellipse(position.x,position.y,25,25);
strokeWeight(1);
stroke(0);
  }
}


float energyLevel(){
return map(energy,0,maxEnergy,0,1);
}

float stateRun(){
if(state.equals("run")){
  return 1;
}
else
return 0;
}

float statePause(){
if(state.equals("pause")){
  return 1;
}
else
return 0;
}


float distFarest(){
  float reponse=0;
  try{
reponse= dist(farest.position.x,farest.position.y,position.x,position.y);
leCoachDelequipe.fitness+=map(reponse,0,width,0,1)/game.teamSize;
}
catch(Exception e){}
return map(reponse,0,width,0,1);
}

float distNearest(){
float reponse= dist(nearest.position.x,nearest.position.y,position.x,position.y);
leCoachDelequipe.fitness+=map(reponse,0,width,1,0)/game.teamSize;
return map(reponse,0,width,0,1);
}

float distBall(){
float reponse= dist(game.ball.position.x,game.ball.position.y,position.x,position.y);
return map(reponse,0,width,0,1);
}

float hasTheBall(){
if(hasBall){
  return 1;
}
else
return 0;
}

float nearestIsAlly(){
if(nearest.teamNumber == teamNumber){
  return 1;
}
else
return 0;
}

float farestIsAlly(){
try{
if(farest.teamNumber == teamNumber){
  return 1;
}
else
return 0;
}
catch(Exception e){
  return 0;
}
}


float nearestIsEnnemy(){
if(nearest.teamNumber != teamNumber){
  return 1;
}
else
return 0;
}

float farestIsEnnemy(){
if(farest.teamNumber != teamNumber){
  return 1;
}
else
return 0;
}




}
