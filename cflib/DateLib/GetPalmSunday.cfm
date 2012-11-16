function GetPalmSunday() {
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  Return DateAdd("d", -7, GetEaster(TheYear));
}