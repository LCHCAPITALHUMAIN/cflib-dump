function Asinh(x)
{
  Var RetVal = 0;
  Var Neg = False;
  if (x EQ 0) {
    RetVal = 0;
  }
  else {
    if (X LT 0) 
	  	Neg = True;
    x = Abs(x);
    if (x GT 1.0e10)
      RetVal = Log(2) + Log(X);
    else {
      RetVal = x^2;
      RetVal = Log(x + RetVal / (1 + Sqr(1 + RetVal)) + 1);
    }
    if (Neg) 
		RetVal = -RetVal;
  }
  Return(RetVal);
}