class VisualNeural{

  final int size=300;
  int x;
  int y;
  int xx=x+size;
  int yy=y+size;
  final int distanceX=15;
  final int distanceY=40;

VisualNeural(int x,int y){
this.x=x;
this.y=y;
}






void see(float[] input,Matrix matrix,float[] input2,Matrix matrix2){
fill(0,50);
rect(x,y,size,size);
float start=0;
for(int i=0;i<input.length;i++){
fill(0);
ellipse(x+map(start,0,5,x,x+size),map(i,-1,input.length,y,y+size),5,5);
}
start=1;
for(int i=0;i<matrix.row;i++){
fill(0);
ellipse(x+map(start,0,5,x,x+size),map(i,-1,matrix.row,y,y+size),5,5);
}
start=2;
for(int i=0;i<1;i++){
fill(0);
ellipse(x+map(start,0,5,x,x+size),map(i,-1,1,y,y+size),5,5);
}
start=3;
for(int i=0;i<input2.length;i++){
fill(0);
ellipse(x+map(start,0,5,x,x+size),map(i,-1,input2.length,y,y+size),5,5);
}
start=4;
for(int i=0;i<matrix2.row;i++){
fill(0);
ellipse(x+map(start,0,5,x,x+size),map(i,-1,matrix2.row,y,y+size),5,5);
}



}


}