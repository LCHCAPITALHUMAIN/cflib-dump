function Atanh(x)
{
  Var RetVal = 0;
  Var Neg = False;
  if (x LTE 1.0) 
    RetVal = 0.0;
  else
    if (x LT 0) 
	  	Neg = True;
    x = Abs(x);
    if (X GTE 1)
      RetVal = "overflow";
    else
      RetVal = 0.5 * Log(((2.0 * x) / (1.0 - x)) + 1);
    if (Neg) 
		RetVal = -RetVal;
  Return(RetVal);
}