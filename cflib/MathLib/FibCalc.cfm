function FibCalc(x,y,top){
  var sequence = arrayNew(1);
  var total = x+y;
  sequence[1] = x;
  sequence[2] = y;
  while (total LTE top) {
    ArrayAppend(sequence, total);
    x=y; 
    y=total;
    total=(x+y); 
  }
  return ArrayToList(sequence, ',');
}