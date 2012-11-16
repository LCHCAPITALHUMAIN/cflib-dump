function IsPerfectNumber(number)
{
  Var i=0;
  Var factors = "";
  Var factorArray=0;
  Var sum=0;
  if (number lt 1){
    return False;
    break;
  }  
  for (i=1; i LTE number/2; i=i+1) {
    if (Int(number/i) EQ number/i) {
      factors = ListAppend(Factors, i);
    }
  }  
  factorArray=ListToArray(factors);
  sum=ArraySum(factorArray);
  if (sum eq number){
    return True;
  }
  else{
    return False;
  }
}