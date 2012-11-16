function FibGen(x,y,numSeq){
  var sequence = arrayNew(1);
  var total = x+y;
  var i=1;
  sequence[1] = x;
  sequence[2] = y;
  while (i LTE numSeq-2) {
    total=(x+y); 
    ArrayAppend(sequence, total);
    x=y; 
    y=total;
    i=i+1;
  }
  return ArrayToList(sequence, ',');
}