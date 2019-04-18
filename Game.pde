import java.util.Collections;

class Game{

Map map;
int teamSize=10;
ArrayList<Players> team1= new ArrayList<Players>();
ArrayList<Players> team2= new ArrayList<Players>();
Ball ball;
Option time;
Tableau tabTeam1;
Tableau tabTeam2;
Brain brainRed;
Brain brainBlue;
Coach red;
Coach blue;
int gameNumber;

boolean invisible;


Game(int gameNumber){
 this.gameNumber=gameNumber;
red = new Coach(team1,this);
blue = new Coach(team2,this);
map=new Map();
time=new Option("Time",width/2,15);
ball= new Ball(this);

for(int i=0;i<teamSize;i++)
team1.add(new Players(red,1,this));
for(int i=0;i<teamSize;i++)
team2.add(new Players(blue,2,this));

tabTeam1=new Tableau(red,team1,0,0);
tabTeam2=new Tableau(blue,team2,width-200,0);

brainRed= new Brain(50,300,red);
brainBlue= new Brain(1050,300,blue);

invisible=false;
}

Game(Coach coach1,Coach coach2,int gameNumber){
  this.gameNumber=gameNumber;
red=new Coach(coach1,team1,this);
blue=new Coach(coach2,team2,this);
  
  
 for(int i=0;i<teamSize;i++)
team1.add(new Players(red,1,this));
for(int i=0;i<teamSize;i++)
team2.add(new Players(blue,2,this));
  
  

map=new Map();
time=new Option("Time",width/2,15);
ball= new Ball(this);


tabTeam1=new Tableau(red,team1,0,0);
tabTeam2=new Tableau(blue,team2,width-200,0);

brainRed= new Brain(50,300,red);
brainBlue= new Brain(1050,300,blue);

invisible=false;
}











void gaming(){
if(invisible)
map.Draw();
if(invisible)
ball.ballDraw();

for(Players p : team1){
p.Playerlogic();
if(invisible)
p.Playerdraw();
}

for(Players p : team2){
  p.Playerlogic();
  if(invisible)
p.Playerdraw();
}

ball.logic();

Collections.sort(team1,new SortEnergy());
Collections.sort(team2,new SortEnergy());
if(invisible)
tabTeam1.tableauShow();
if(invisible)
tabTeam2.tableauShow();

if(invisible)
brainRed.show();
if(invisible)
brainBlue.show();

red.Coaching();
blue.Coaching();







}





void show(boolean n){
if(n==true)
invisible=true;
else
invisible=false;
}



Coach winner(){
if(red.fitness>blue.fitness)
return red;
else
return blue;
}





}
