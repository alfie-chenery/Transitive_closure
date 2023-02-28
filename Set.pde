class Set{
  ArrayList<Pair> elements;
  
  Set(){
    elements = new ArrayList<Pair>(); 
  }
  
  void add(Pair p){
    boolean add = true;
    for(Pair q : elements){
      if(p.equals(q)){
        add = false; 
      }
    }
    if(add){
      elements.add(p); 
    }
  }
  
  void addAll(ArrayList<Pair> others){
    for(Pair p : others){
      add(p); 
    }
  }
  
  Set copy(){
    Set copy = new Set();
    for(Pair p : elements){
      copy.add(p.copy()); 
    }
    return copy;
  }
  
  String toString(){
    String out = "{";
    for(Pair p : elements){
      out += p.toString() + "\n "; 
    }
    return out.substring(0,out.length()-2) + "}";
  }
  
}
