function GetTrinitySunday() {
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  Return DateAdd("d", 56, GetEaster(TheYear));
}