class Matrix{
float[][] myArray;
int col;
int row;

Matrix(int row,int col){

myArray = new float[row][col];
this.col=col;
this.row=row;
initiate();

}

void initiate(){
for(int i=0;i<col;i++){
  for(int y=0;y<row;y++){
    myArray[y][i]=random(1);
  }
} 
}



float[] multi(float[] input){
  float[] output=new float[row];
    if(input.length==col){
      for(int i=0;i<col;i++){
        for(int y=0;y<row;y++){
          output[y]+=myArray[y][i]*input[i];
            }
          } 
        }
  return output;
}


void drawsAction(int x,int y){
for(int i=0;i<col;i++){
  for(int l=0;l<row;l++){
    fill(255);
    ellipse(l*20+x,i*15+y,map(myArray[l][i],0,1,0,15),map(myArray[l][i],0,1,0,15));
    if(i==col-1)
    if(mouseX>l*20+x-7&&mouseX<l*20+x+7)
    if(mouseY>i*15+y-7&&mouseY<i*15+y+7){
      fill(255,0,0);
       textSize(20);
      text(Terme.actions[l],l*20+x-50,i*15+y);
      fill(0);
      textSize(10);
    }
  }
} 
}


void drawsPlayer(int x,int y){
for(int i=0;i<col;i++){
  for(int l=0;l<row;l++){
    fill(255);
    ellipse(l*20+x,i*15+y,map(myArray[l][i],0,1,0,15),map(myArray[l][i],0,1,0,15));
    if(i==col-1)
    if(mouseX>l*20+x-7&&mouseX<l*20+x+7)
    if(mouseY>i*15+y-7&&mouseY<i*15+y+7){
      fill(255,0,0);
       textSize(20);
      text(Terme.choixplayers[l],l*20+x-50,i*15+y);
      fill(0);
      textSize(10);
    }
  }
} 
}


}