function listAddAnd(list) {
  var i = 1;
  var delimiter = ',';
  var returnValue = '';
  if(ArrayLen(arguments) GTE 2)
    delimiter = arguments[2];
  list = ListToArray(list, delimiter);
  if(arrayLen(list) eq 1) return list[1];
  if(arrayLen(list) eq 2) return list[1] & ' and ' & list[2];

  for(i = 1; i LTE ArrayLen(list); i = i + 1)
  if (i LTE (Arraylen(list) - 1)) returnValue = returnValue & list[i] & ', ';
  else returnValue = returnValue &   ' and ' & list[i];
  return returnValue;
}