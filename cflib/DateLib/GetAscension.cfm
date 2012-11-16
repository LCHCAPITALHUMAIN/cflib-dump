function GetAscension() {
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  Return DateAdd("d", 39, GetEaster(TheYear));
}