int ballxpos = 70;
int ballypos = 300;
int ballxspeed = 3;
int ballyspeed = 0;
int yplayer1 = 260;
int yplayer2 = 260;
int p1score = 0;
int p2score = 0;
int hits = 0;
boolean canSpeed = false;

void setup(){
  size(800, 600);
  frameRate(60);
  noStroke();
  fill(#FFFFFF);
  textSize(32);
}

void draw(){
  background(#000000);
  text(str(p1score), 300, 70);
  text(str(p2score), 480, 70);
  player1();
  player2();
  ballxpos += ballxspeed;
  ballypos += ballyspeed;
  ball();
  p1collision();
  p2collision();
  wallcollision();
  score();
  if(((hits % 5) == 0) && (canSpeed == true)){
    if(ballxspeed < 0){
      ballxspeed--;
    }
    else{
      ballxspeed++;
    }
    canSpeed = false;
  }
}

void score(){
  if(ballxpos > 800){
    p1score++;
    ballxpos = 70;
    reset();
  }
  if(ballxpos < 0){
    p2score++;
    ballxpos = 530;
    reset();
  }
}

void reset(){
  ballypos = 300;
  ballyspeed = 0;
  ballxspeed = 3;
  hits = 0;
}

void p1collision(){
  if((ballxpos < 40) && (ballxpos > 20) && (ballypos > (yplayer1 - 7)) && (ballypos < (yplayer1 + 87))){
    ballxspeed *= -1;
    hits++;
    canSpeed = true;
    if(ballypos < yplayer1){
      ballyspeed = -7;
    }
    else if(ballypos < (yplayer1 + 20)){
      ballyspeed = -5;
    }
    else if(ballypos < (yplayer1 + 38)){
      ballyspeed = -3;
    }
    if(ballypos > (yplayer1 + 42)){
      if(ballypos < (yplayer1 + 60)){
        ballyspeed = 3;
      }
      else if(ballypos < (yplayer1 + 80)){
        ballyspeed = 5;
      }
      else{
        ballyspeed = 7;
      }
    }
  }
}

void p2collision(){
  if((ballxpos > 760) && (ballxpos < 780) && (ballypos > (yplayer2 - 7)) && (ballypos < (yplayer2 + 87))){
    ballxspeed *= -1;
    hits++;
    canSpeed = true;
    if(ballypos < (yplayer2 + 20)){
      ballyspeed = -5;
    }
    else if(ballypos < (yplayer2 + 38)){
      ballyspeed = -3;
    }
    if(ballypos > (yplayer2 + 42)){
      if(ballypos < (yplayer2 + 60)){
        ballyspeed = 3;
      }
      else if(ballypos < (yplayer2 + 80)){
        ballyspeed = 5;
      }
      else{
        ballyspeed = 7;
      }
    }
  }
}

void wallcollision(){
  if((ballypos < 0) || (ballypos > 600)){
    ballyspeed *= -1;
  }
}

void player1(){
  rect(20, yplayer1, 10, 80, 7);
}

void player2(){
  rect(770, yplayer2, 10, 80, 7);
}

void ball(){
  circle(ballxpos, ballypos, 15);
}

void keyPressed(){
  if((key == 'w') && (yplayer1 > 0)){
    yplayer1 -= 20;
  }
  if((key == 's') && (yplayer1 < 520)){
    yplayer1 += 20;
  }
  if(key == CODED){
    if((keyCode == UP) && (yplayer2 > 0)){
      yplayer2 -= 20;
    }
    if((keyCode == DOWN) && (yplayer2 < 520)){
      yplayer2 += 20;
    }
  }
}
