class Pair{
  int first;
  int second;
  
  Pair(int a, int b){
    first = a;
    second = b;
  }
  
  String toString(){
    return "<" + first + ", " + second + ">"; 
  }
  
  boolean equals(Pair other){
     return first == other.first && second==other.second;
  }
  
  Pair copy(){
    return new Pair(first, second); 
  }
  
  
  
}
