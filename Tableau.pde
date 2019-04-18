class Tableau{
ArrayList<Players> player;
int positionX;
int positionY;
int largeur=138;
int hauteur=20;
Coach c;

Tableau(Coach c,ArrayList<Players> player,int positionX,int positionY){
this.c=c;
this.player=player;
this.positionX=positionX;
this.positionY=positionY;
}


void tableauShow(){
  fill(0);
  textSize(15);
  text(c.name+" " + (int)c.fitness,positionX+10,positionY+25);
  int x=positionX;
  int y=positionY+30;
  textSize(10);
for(Players n:player){
fill(n.team.teamColor,80);
stroke(1,255);
rect(x,y,largeur,hauteur);
rect(x+largeur,y,largeur/5,hauteur);
rect(x+largeur+largeur/5,y,largeur/4,hauteur);
ellipse(x+5,y+hauteur/2,5,5);
fill(0);
text(n.name,x+10,y+15);
text(round(n.energy),x+5+largeur,y+15);
text(n.state,x+5+largeur+largeur/5,y+15);
y+=hauteur;
}




}




}