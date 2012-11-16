function Mean(values)
{
  if (IsArray(values)){
     Return ArrayAvg(values);
    }
  else {
     Return ArrayAvg(ListToArray(values));
    }  
}