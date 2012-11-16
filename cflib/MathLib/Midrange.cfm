function Midrange(values)
{
  Var MyArray = 0;
  if (IsArray(values)){
     MyArray = values;
    }
  else {
     MyArray = ListToArray(values);
    }
  Return ((ArrayMax(MyArray) + ArrayMin(MyArray))/2);
}