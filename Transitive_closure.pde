int N = 6; //size of set A (0 indexed)
//A = {0,1,2,3,...,N-2,N-1}  -  R is a binary relation on A

Set R;
Set S;

void setup(){
  size(800,800);
  background(0);
  
  R = new Set();
  S = new Set();;

  R.add(new Pair(0,2));
  R.add(new Pair(2,1));
  R.add(new Pair(1,3));
  R.add(new Pair(3,4));
  S = R.copy();

  
  for(int i=0; i<1000; i++){
    ArrayList<Pair> T = new ArrayList<Pair>();
    for(Pair p : S.elements){
      for(Pair q : S.elements){
        if(p.second == q.first){
          T.add(new Pair(p.first, q.second));
        }
      }
    }
    S.addAll(T);
  }


  //printArray(R);
  printArray(S);
  
  textSize(16);
  textAlign(CENTER,CENTER);
  stroke(255);
  noFill();
  
  //Draw R
  drawGraph(R, 150, new PVector(200,200), -HALF_PI);
  //Draw R+
  drawGraph(S, 150, new PVector(width-200,200), -HALF_PI); 
  
  textAlign(CENTER,TOP);
  text(R.toString(), 200,380);
  text(S.toString(), width-200, 380);
}


void drawGraph(Set set, int r, PVector c, float offset){
  strokeWeight(10);
  for(int i=0; i<N; i++){
    float theta = offset + i*TWO_PI/N;
    point(c.x + r*cos(theta), c.y + r*sin(theta));
    text(i, c.x + (r+15)*cos(theta), c.y + (r+15)*sin(theta));
  }
  strokeWeight(3);
  for(Pair p : set.elements){
    float a = p.first * TWO_PI/N + offset;
    float b = p.second * TWO_PI/N + offset;
    
    if(a==b){ //reflexive pairs
      noFill();
      circle(c.x + (r+15)*cos(a), c.y + (r+15)*sin(a), 30);
    }else{ //non-reflexive pairs
      arrow(new PVector(c.x + r*cos(a), c.y + r*sin(a)), new PVector(c.x + r*cos(b), c.y + r*sin(b)));
    }
  }
}

void arrow(PVector start, PVector end){
  pushMatrix();
  
  translate(start.x, start.y);
  
  float theta = PVector.angleBetween(PVector.sub(end,start), new PVector(1,0));
  float len = PVector.dist(start,end);
  
  //if arrow points upwards angle calculated is acute angle anticlockwise
  //rotate always treats angle as clockwise so theta needs inverting
  theta = (end.y < start.y ? -theta : theta);
    
  rotate(theta);
  
  line(0,0,len,0);
  fill(255);
  beginShape();
  vertex(len-20,0);
  vertex(len-30, -5);
  vertex(len-30, 5);
  endShape(CLOSE);
  
  popMatrix();
  
}
