function Median(values)
{
  Var x = 0;
  Var NumberOfElements = 0;
  Var LeftCenterPosition = 0;
  Var RightCenterPosition = 0;
  Var MyArray = 0;
  if (IsArray(values)){
     MyArray = values;
    }
  else {
     MyArray = ListToArray(values);
    }
  ArraySort(MyArray, "numeric");
  x = ArrayToList(MyArray);
  NumberOfElements = ListLen(x);
  if ((NumberOfElements MOD 2) EQ 0) {
	  LeftCenterPosition = ListGetAt(x, (Int(NumberOfElements/2)), ",");
	  RightCenterPosition = ListGetAt(x, (Int(NumberOfElements/2)+1), ",");
	  Return (LeftCenterPosition + RightCenterPosition)/2;
    }
  else {
	  Return ListGetAt(x, Int(NumberOfElements/2)+1, ",");
    }
}