class Training{
ArrayList<Coach> lesBonCoach=new ArrayList<Coach>();
ArrayList<Coach> trainedCoach=new ArrayList<Coach>();
int nombreParNiveau;
int mutation=100;

Training(ArrayList<Coach> lesBonCoach,int nombreParNiveau){
  trainedCoach=new ArrayList<Coach>();
  for(Coach n:lesBonCoach){
  this.lesBonCoach.add(n);
  }
  for(int i=0;i<nombreParNiveau/1.5;i++){
  trainedCoach.add(this.lesBonCoach.get(i));
  }
this.nombreParNiveau=nombreParNiveau;
melangeADN();
}




void melangeADN(){                   //mix des premier
  
for(int i = 0 ; i < nombreParNiveau/1.5; i++){
trainedCoach.add(adnMix(lesBonCoach.get(i),lesBonCoach.get(i+1)));
}
while(trainedCoach.size()<nombreParNiveau+1){
trainedCoach.add(new Coach(new ArrayList<Players>(),new Game(0)));
}
while(trainedCoach.size()>nombreParNiveau+1){
trainedCoach.remove(trainedCoach.size()-1);
}

}




Coach adnMix(Coach a,Coach b){
  Coach result=new Coach(new ArrayList<Players>(),new Game(0));
for(int i=0;i<result.deciPlayer.col;i++){
  for(int y=0;y<result.deciPlayer.row;y++){
    if(int(random(2))==1)
    result.deciPlayer.myArray[y][i]=b.deciPlayer.myArray[y][i];
    else
    result.deciPlayer.myArray[y][i]=a.deciPlayer.myArray[y][i];
  }
} 
for(int n=0;n<result.deciAction.length;n++)
for(int i=0;i<result.deciAction[n].col;i++){
  for(int y=0;y<result.deciAction[n].row;y++){
    if(int(random(2))==1)
    result.deciAction[n].myArray[y][i]=b.deciAction[n].myArray[y][i];
    else
    result.deciAction[n].myArray[y][i]=a.deciAction[n].myArray[y][i];
  }
} 

//mutation
for(int n=0;n<result.deciAction.length;n++)
for(int i=0;i<result.deciAction[n].col;i++){
  for(int y=0;y<result.deciAction[n].row;y++){
    if(int(random(mutation))==1)
    result.deciAction[n].myArray[y][i]=random(1);
  }
} 

return result;



}


ArrayList<Coach> nouveauCoach(){
return trainedCoach;
}





}
