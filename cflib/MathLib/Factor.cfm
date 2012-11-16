function factor(integer)
{
  Var i=0; 
  Var Factors = "";
  for (i=1; i LTE integer/2; i=i+1) {
    if (Int(integer/i) EQ integer/i) {
      Factors = ListAppend(Factors, i);
    }
  }
  Return ListAppend(Factors, integer);
}