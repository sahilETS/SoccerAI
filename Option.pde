class Option{
  
  
 String text;
int positionX;
int positionY;
  
  

Option(String text,int positionX,int positionY){
this.text=text;
this.positionX=positionX;
this.positionY=positionY;
}


void affiche(int input){
fill(0);
textSize(20);
text(text+" " + input,positionX,positionY);
}

}