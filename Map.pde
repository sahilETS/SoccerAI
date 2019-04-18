class Map{

Map(){



}

void Draw(){
grass.resize(width,height);
image(grass,0,0);  
loadPixels();
for (int i = 0; i < width*height; i++) {
  //if(i % width<width/2)
//  pixels[i] =color(0, 255, 0);
  if(i % width==width/2)
  pixels[i] =color(0, 0, 0);
 // if(i % width>width/2)
 // pixels[i] =color(0,255,0);
}
updatePixels();



}

}