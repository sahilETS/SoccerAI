class Ranking{
ArrayList<Coach> coach;
int positionX;
int positionY;
int largeur=138;
int hauteur=20;

Ranking(ArrayList<Coach> coach,int positionX,int positionY){
this.coach=coach;
this.positionX=positionX;
this.positionY=positionY;
}


void tableauShow(){
  int x=positionX;
  int y=positionY;
  textSize(10);
 int counter=0;
for(Coach n:coach){
fill(n.teams.get(0).team.teamColor,80);
stroke(1,255);
rect(x,y,largeur,hauteur);
rect(x+largeur,y,largeur/3,hauteur);
rect(x+largeur+largeur/3,y,largeur/3,hauteur);
ellipse(x+5,y+hauteur/2,5,5);
fill(0);
text(n.name,x+10,y+15);
text(round(n.fitness),x+5+largeur,y+15);
text(round(n.game.gameNumber),x+5+largeur+largeur/3,y+15);
y+=hauteur;
if(counter==25)
break;
counter++;
}

}

}