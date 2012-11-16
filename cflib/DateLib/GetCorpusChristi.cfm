function GetCorpusChristi() {
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  Return DateAdd("d", 60, GetEaster(TheYear));
}