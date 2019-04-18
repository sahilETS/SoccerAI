class Coach{
ArrayList<Players> teams;
Players playerChoisi;

String name;

float fitness;

float[] TeamInputs;
float[] PlayerInputs;

Matrix deciPlayer;
Matrix[] deciAction;
Game game;
float[] outputs;
int decision;

Players chosen;


static final int inputInitial=5;    //5 inputs de team
static final int nbrChoixPlayer=5;   //5 choix de player differebt
static final int inputSecond=11;      //11 inputs de player choisi
static final int nbrChoixAction=11;    //11 actions


///////////////////////////////////////////////////////////////////////////////




Coach(ArrayList<Players> teams,Game game){
 deciAction=new Matrix[nbrChoixPlayer];
this.game=game; 
name = new Name().nom;
playerChoisi=null;
this.teams=teams;
deciPlayer=new Matrix(nbrChoixPlayer,inputInitial);
for(int i=0;i<deciAction.length;i++)
deciAction[i]=new Matrix(nbrChoixAction,inputInitial+inputSecond);
TeamInputs=new float[inputInitial];
PlayerInputs=new float[inputInitial+inputSecond];
}



Coach(Coach c,ArrayList<Players> teams,Game game){
this.game=game; 
name = c.name;
playerChoisi=null;
this.teams=teams;
deciPlayer=c.deciPlayer;
deciAction=c.deciAction;
TeamInputs=new float[inputInitial];
PlayerInputs=new float[inputInitial+inputSecond];
}

//////////////////////////////////////////////////////////////////////////////////////



  void Coaching(){
   setInputPlayer();                                          //rentre les inputs
   outputs = deciPlayer.multi(TeamInputs);                  //calcule les weigths
   decision = decisionMaker(outputs);                         // prend le plus grand
   chosen = chosePlayer(decision);                            //choisi le bon player
   setInputOFThePlayer(chosen);                                  //rentre les inputs
   outputs = deciAction[decision].multi(PlayerInputs);                    //calcule les weigths
   decision =decisionMaker(outputs);                              // prend le plus grand
   choseAction(decision,chosen);
  }

///////////////////////////////////////////////////////////////////////////////////////////

void setInputPlayer(){
  TeamInputs[0]=collectiveEnergy();
  TeamInputs[1]=collectivePausing();
  TeamInputs[2]=collectiveRunning();
  TeamInputs[3]=collectiveDistance();
  TeamInputs[4]=hasBallTeam();
}

void setInputOFThePlayer(Players player){
PlayerInputs[0]= TeamInputs[0];
PlayerInputs[1]= TeamInputs[1];
PlayerInputs[2]= TeamInputs[2];
PlayerInputs[3]= TeamInputs[3];
PlayerInputs[4]= TeamInputs[4];
PlayerInputs[5]= player.energyLevel();
PlayerInputs[6]= player.stateRun();
PlayerInputs[7]= player.statePause();
PlayerInputs[8]= player.distFarest();
PlayerInputs[9]= player.distNearest();
PlayerInputs[10]= player.distBall();
PlayerInputs[11]= player.hasTheBall();
PlayerInputs[12]= player.nearestIsAlly();
PlayerInputs[13]= player.nearestIsEnnemy();
PlayerInputs[14]= player.farestIsAlly();
PlayerInputs[15]= player.farestIsEnnemy();
}

/////////////////////////////////////////////////////////////////////////////////////////////


int decisionMaker(float[] tab){
int decisionChoisi=0;
float max=0;
for(int i=0;i<tab.length;i++){
if(tab[i]>max){
decisionChoisi=i;
max=tab[i];
}
}
return decisionChoisi;
}


//int decisionMaker(float[] tab){
//float[] tabTemp= new float[tab.length];
//for(int i=0;i<tab.length;i++)
//tabTemp[i]=random(tab[i]);
//int decisionChoisi=0;
//float max=0;
//for(int i=0;i<tabTemp.length;i++){
//if(tabTemp[i]>max){
//decisionChoisi=i;
//max=tabTemp[i];
//}
//}
//return decisionChoisi;
//}
///////////////////////////////////////////////////////////////////////////////////////////////////



Players chosePlayer(int decision){
Players temp=null;
  switch(decision){
case 0:
temp=randomPlayer();
break;
case 1:
temp=nearBallPlayer();
break;
case 2:
temp=farBallPlayer();
break;
case 3:
temp=leastEnergy();
break;
case 4:
temp=mostEnergy();
break;
  }
  return temp;
}


///////////////////////////////////////////////

void choseAction(int decision,Players player){

  switch(decision){
  
   case 0:
   player.pass(nearPlayerDirection(player));
  break;
   case 1:
   player.pass(farPlayerDirection(player));
  break;
   case 2:
   player.pause();
  break;
   case 3:
   player.run(ballDirection(player));
  break;
   case 4:
   player.run(nearPlayerDirection(player));
  break;
   case 5:
   player.run(farPlayerDirection(player));
  break;
   case 6:
   player.pass(inverseNearPlayerDirection(player));
  break;
   case 7:
   player.pass(inverseFarPlayerDirection(player));
  break;
   case 8:
   player.run(inverseBallDirection(player));
  break;
   case 9:
   player.run(inverseNearPlayerDirection(player));
  break;
   case 10:
   player.run(inverseFarPlayerDirection(player));
  break;
  case 11:
   player.pass(but(player));
  break;
  }



}















////////////////////COACH PLAYER CHOOSE//////////////////////////////

//chose a random player

Players randomPlayer(){
 int lePlayer =int(random(teams.size())); 
return teams.get(lePlayer);
}



//chose nearest from ball

Players nearBallPlayer(){
PVector reponse=new PVector();
PVector min=new PVector();
int lePlayer=0;
PVector.sub(teams.get(0).position, game.ball.position,min);
for(int i=0;i<teams.size();i++){
PVector.sub(teams.get(i).position, game.ball.position,reponse);
if(reponse.mag()<min.mag()){
lePlayer=i;
min.set(reponse);
}
}
return teams.get(lePlayer);
}


//chose farest from ball

Players farBallPlayer(){
PVector reponse=new PVector();
PVector max=new PVector();
int lePlayer=0;
PVector.sub(teams.get(0).position, game.ball.position,max);
for(int i=0;i<teams.size();i++){
PVector.sub(teams.get(i).position, game.ball.position,reponse);
if(reponse.mag()>max.mag()){
lePlayer=i;
max.set(reponse);
}
}
return teams.get(lePlayer);
}



Players mostEnergy(){
int max=0;
int lePlayer=0;
max=teams.get(0).energy;
for(int i=0;i<teams.size();i++){
if(teams.get(i).energy>max){
lePlayer=i;
max = teams.get(i).energy;
}
}
return teams.get(lePlayer);
}

Players leastEnergy(){
int max=0;
int lePlayer=0;
max=teams.get(0).energy;
for(int i=0;i<teams.size();i++){
if(teams.get(i).energy<max){
lePlayer=i;
max = teams.get(i).energy;
}
}
return teams.get(lePlayer);
}











/////////////////////////////////////////coach ACTION////////////////////////


PVector nearPlayerDirection(Players p){
return PVector.sub(p.nearest.position,p.position);

}

PVector farPlayerDirection(Players p){
return PVector.sub(p.farest.position,p.position);
}

PVector inverseNearPlayerDirection(Players p){
return PVector.sub(p.nearest.position,p.position).mult(-1);
}

PVector inverseFarPlayerDirection(Players p){
return PVector.sub(p.farest.position,p.position).mult(-1);
}

PVector ballDirection(Players p){
return PVector.sub(game.ball.position,p.position);
}

PVector inverseBallDirection(Players p){
return PVector.sub(game.ball.position,p.position).mult(-1);
}

PVector but(Players p){
  PVector leBut;
if(p.teamNumber==1)
leBut = new PVector(width,height/2);
else
leBut = new PVector(0,height/2);
return PVector.sub(leBut,p.position).normalize().mult(5);
}


///////////////////////////////////////NEW METHOD///////////////////////////////////////////////////

///////////////////////////////////////4 TEAM INPUTS///////////////////////////////////////////////////
float collectiveEnergy(){
  int max= Players.maxEnergy * teams.size();
  float reponse=0;
  for(Players p : teams){
    reponse += p.energy;
  }
  return map(reponse,0,max,1,0);
}

float collectiveRunning(){
   int counter=0;
  for(Players p : teams){
    if(p.state.equals("run"))
    counter++;
  }
  return map(counter,0,teams.size(),0,1);
}

float collectivePausing(){
   int counter=0;
  for(Players p : teams){
    if(p.state.equals("pause"))
    counter++;
  }
  return map(counter,0,teams.size(),0,1);
}

float collectiveDistance(){
   int adder=0;
  for(Players p : teams){
    adder+=dist(game.ball.position.x,game.ball.position.y,p.position.x,p.position.y);
  }
  adder=adder/teams.size();
  fitness+=map(adder,width,0,0,1);
  return map(adder,width,0,0,1);
}

float hasBallTeam(){
   boolean hasBall=false;
  for(Players p : teams){
    if(p.hasBall)
    hasBall=true; 
  }
  if(hasBall)
  return 1;
  else
  return 0;
}

///////////////////////////////////////4 TEAM INPUTS///////////////////////////////////////////////////

///////////////////////////////////////NEW METHOD///////////////////////////////////////////////////
///////////////////////////////////////NEW METHOD///////////////////////////////////////////////////
///////////////////////////////////////NEW METHOD///////////////////////////////////////////////////






































}
