function IsPrimeNumber(inNum)
{
  var i=0;
  if (inNum lt 2){
    return False;
    break;
  }
  for (i=2; i LTE (sqr(inNum)); i=i+1) {
    if (NOT inNum MOD i) {
      return False;
      break;
    }
  }
  return True;
}