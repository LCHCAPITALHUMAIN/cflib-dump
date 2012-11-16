function GetSeptuagesima() {
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  Return DateAdd("d", -63, GetEaster(TheYear));
}