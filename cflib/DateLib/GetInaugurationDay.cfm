//Inauguration Day: Jan 20, every 4 years ,2001,2005 etc. If Jan 20 is Sunday, InaugurationDay is Jan 21
// for other  years, -1 is returned
function GetInaugurationDay() 
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  if(TheYear MOD 4 eq 1){ 
    if(DayOfWeek(CreateDate(TheYear,1,20)) eq 1){  //Sunday
      return CreateDate(TheYear,1,21);
    }
    else{
      return CreateDate(TheYear,1,20);
    }
  } 
  else{
    return -1;
  }
}