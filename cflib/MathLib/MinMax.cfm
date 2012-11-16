function MinMax(values)
{
  Var MyArray = 0;
  Var mMinMax = StructNew();
  if (IsArray(values)){
     MyArray = values;
    }
  else {
     MyArray = ListToArray(values);
    }
  mMinMax["MinVal"] = ArrayMin(MyArray);
  mMinMax["MaxVal"] = ArrayMax(MyArray);
  Return mMinMax;
}