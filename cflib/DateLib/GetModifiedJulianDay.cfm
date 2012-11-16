function GetModifiedJulianDay()
{
  var date = Now();
  var ModifiedJulianDay = 0;
  if(ArrayLen(Arguments)) 
    date = Arguments[1];	
  ModDate = GetJulianDay(date);
  ModifiedJulianDay = ModDate - 2400000.5;
  return ModifiedJulianDay;
}