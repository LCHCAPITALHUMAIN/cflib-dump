function Acosh(x)
{
  Var RetVal = 0;
  if (x LTE 1.0) 
    RetVal = 0.0;
  else if (x GTE 1.0e10) 
    RetVal = Log(2) + Log(x);
  else
    RetVal = Log(x + Sqr((x - 1.0) * (x + 1.0)));
  Return(RetVal);
}