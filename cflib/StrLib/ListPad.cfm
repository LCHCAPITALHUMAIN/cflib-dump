function ListPad(list, char, strLen)
{
  Var PaddedList = "";
  Var PadLen = 0;
  Var Delimiter = ",";
  Var i=0;
  if (ArrayLen(arguments) gt 3){
    Delimiter = arguments[4];
  }
  for (i=1; i LTE ListLen(list, delimiter); i=i+1){
    PadLen = strLen-Len(ListGetAt(list, i, delimiter));
    if (PadLen GTE 0){
		  PaddedList = ListAppend(PaddedList, RepeatString(char, PadLen) & ListGetAt(list, i, delimiter), delimiter);
    }
    else {
      PaddedList = ListAppend(PaddedList, ListGetAt(list, i, delimiter), delimiter);
    }
  }
  Return PaddedList;
}