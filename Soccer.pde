import java.util.*;
import java.lang.*;
import java.io.*;
PImage grass;
PImage ballImage;
ArrayList<Coach> best;
ArrayList<Coach> redutilisable;
ArrayList<Coach> blueutilisable;
ArrayList<Coach> redutiliser;
ArrayList<Coach> blueutiliser;
ArrayList<Coach> ranker;
boolean option=true;
boolean extra=true;
Game[] games;
int realtime;

int time=1000;
final int nbrGame=500;
int gameSeer=0;
int brainer=0;
Ranking rank;

void setup(){
  
fullScreen();
grass =loadImage("grass.png"); 
ballImage =loadImage("ball.png"); 
best= new ArrayList<Coach>(nbrGame);
redutiliser= new ArrayList<Coach>(nbrGame);
blueutiliser= new ArrayList<Coach>(nbrGame);
ranker= new ArrayList<Coach>(nbrGame*2);
games = new Game[nbrGame];
realtime=time;
  for(int i=0;i<games.length;i++){
  games[i]= new Game(i);
  redutiliser.add(games[i].red);
  blueutiliser.add(games[i].blue);
  ranker.add(games[i].red);
  ranker.add(games[i].blue);
  }
rank= new Ranking(ranker,300,200);
games[0].show(true);
}   




void draw(){
 for(Game game:games){
   
   /////life/////
   game.gaming();
   Collections.sort(redutiliser,new SortFitness());
   Collections.sort(blueutiliser,new SortFitness());
   Collections.sort(ranker,new SortFitness());
   ///////death///////
   
  }
  if(option)
  rank.tableauShow();
  textSize(20);
   text("Time: "+realtime+"  "+"Game: "+gameSeer,width/2+5,25);
   if(realtime<0){
     reset();
   }
realtime--;
}



void reset(){
realtime=time;
Training train=new Training(redutiliser,nbrGame); 
Training train2=new Training(blueutiliser,nbrGame); 


redutilisable=train.nouveauCoach();
blueutilisable=train2.nouveauCoach();

redutiliser= new ArrayList<Coach>(nbrGame);
blueutiliser= new ArrayList<Coach>(nbrGame);
ranker= new ArrayList<Coach>(nbrGame*2);

rank= new Ranking(ranker,300,200);


for(int i=0;i<games.length;i++){
games[i]= new Game(redutilisable.get(i),blueutilisable.get(i),i);
blueutiliser.add(games[i].blue);
redutiliser.add(games[i].red);
ranker.add(games[i].red);
ranker.add(games[i].blue);
}

games[gameSeer].show(true);
}


void keyPressed(){
if(keyCode=='1'){
if(time==1000)
time=500;
else if(time==500)
time=100;
else if(time==100)
time=1000;



}
if(keyCode==RIGHT){
games[gameSeer].show(false);
gameSeer++;
if(gameSeer>=games.length)
gameSeer=0;
games[gameSeer].show(true);
}
if(keyCode==LEFT){
games[gameSeer].show(false);
gameSeer--;
if(gameSeer<0)
gameSeer=games.length-1;
games[gameSeer].show(true);
}
if(keyCode==UP){
option=!option;
}
if(keyCode==DOWN){
extra=!extra;
}
if(key==' '){
brainer++;
if(brainer>Coach.nbrChoixPlayer-1 )
brainer=0;
}

}
