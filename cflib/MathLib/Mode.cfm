function Mode(values)
{
  Var MyStruct = StructNew();
  Var Frequency = 0;
  Var Mode = "";
  Var mMode = StructNew();
  Var i=0;
  if (IsArray(values)){
     values = ArrayToList(values);
    }
  for (i=1; i LTE ListLen(values); i=i+1) {  
    element = ListGetAt(values, i);
    if (StructKeyExists(MyStruct, element)) {
      StructUpdate(MyStruct, element,  IncrementValue(MyStruct[element]));		
      }
    else {
      StructInsert(MyStruct, element, "1");
    }
  }
  MyKeyArray = StructKeyArray(MyStruct);
  for (i=1; i LTE ArrayLen(MyKeyArray); i=i+1) {
  	if (MyStruct[MyKeyArray[i]] GTE Frequency) {
  		Frequency = MyStruct[MyKeyArray[i]];
      }
  }
  for (i=1; i LTE ArrayLen(MyKeyArray); i=i+1) {
    if (MyStruct[MyKeyArray[i]] eq Frequency) {
  	  Mode = ListAppend(Mode, MyKeyArray[i]);
      }
  }
 mMode["Mode"] = ListSort(Mode, "Numeric");
 mMode["Frequency"] = Frequency;
 Return mMode;
}