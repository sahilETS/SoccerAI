class Brain{
int x;
int y;
Coach c;

Brain(int x,int y,Coach c){
this.x=x;
this.y=y;
this.c=c;
}

void show(){
if(extra){
  c.deciPlayer.drawsPlayer(x,y);
  fill(0);
for(int i=0;i<c.TeamInputs.length;i++){
text(c.TeamInputs[i],x-50,y+15*i);
if(mouseX>x-50-5&&mouseX<x-50+25)
if(mouseY>y+15*i-5&&mouseY<y+15*i+5){
fill(255,0,0);
textSize(20);
text(Terme.inputPlayers[i],x-50+40,y+15*i);
textSize(10);
fill(0);
}
}
c.deciAction[brainer].drawsAction(x,y+100);
fill(0);
for(int i=0;i<c.PlayerInputs.length;i++){
text(c.PlayerInputs[i],x-50,y+100+15*i);
if(mouseX>x-50-5&&mouseX<x-50+25)
if(mouseY>y+100+15*i-5&&mouseY<y+100+15*i+5){
fill(255,0,0);
textSize(20);
text(Terme.inputTeams[i],x-50+40,y+100+15*i);
textSize(10);
fill(0);
}
}
fill(0);
text(Terme.choixplayers[brainer],x+100,y+30);
}
}




}