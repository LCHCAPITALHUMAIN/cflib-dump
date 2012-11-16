function GetTimeFromMinutes(minutes)
{
  Var tHr = (((minutes\60)-1) Mod 24)+1;
  Var tMin = minutes-(tHr*60);
  return CreateTime(tHr,tMin, 0);
}