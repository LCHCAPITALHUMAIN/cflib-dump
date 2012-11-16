function ListRemoveNulls(list) {
  var delim = ",";
       
  if(arrayLen(arguments) gt 1) delim = arguments[2];
  while (Find(delim & delim, list) GT 0){
      list = replace(list, delim & delim, delim, "ALL");
  }
  
  if (left(list, 1) eq delim) list = right(list, Len(list) - 1);
  if (right(list, 1) eq delim) list = Left(list, Len(list) - 1);
  return list;
}