function listSum(listStr)
{
  var delim = ",";
  if(ArrayLen(Arguments) GTE 2) 
    delim = Arguments[2];
  return ArraySum(ListToArray(listStr, delim));
}