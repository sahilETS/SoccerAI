class Team{
  
 String teamName;
 color teamColor;
 int team;

Team(int team){
switch(team){
case 1:
teamName="Red";
teamColor=color (255,0,0);
break;
case 2:
teamName="Blue";
teamColor=color (0,0,255);
break;
}
this.team=team;
}

PVector positionInit(){
PVector initial=new PVector();
if(team==1)
initial.x=random(0,width/2-1);
if(team==2)
initial.x= random(width/2+1,width);
initial.y=random(height);
return initial;
}


}
