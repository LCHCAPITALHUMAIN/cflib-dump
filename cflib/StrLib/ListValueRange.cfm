function ListValueRange(min,max)
{
  Var cnt=0;
  Var outstring="";
  Var delimiter=",";
  if (ArrayLen(arguments) eq 3){
    Delimiter = arguments[3];
  }
  for(cnt=min;cnt lte max;cnt=cnt+1){
    if (cnt eq 1){
      outstring=""&cnt;
    }
    else{
      outstring=""&outstring&","&cnt;
    }
  }
  return outstring;
}