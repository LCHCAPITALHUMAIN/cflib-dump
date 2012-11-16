function ListCountSubstring(lst, str) {
  var pos = 1;
  var count = 0;
  var newlst = "";
  var delim = ",";

  if(arrayLen(arguments) gte 3) delim = arguments[3];

  newlst = lst; //list to work on
  while(pos neq 0){
    pos = listContainsNoCase(newlst, str, delim);
    if (pos neq 0){ 
      newlst = listDeleteAt(newlst,pos,delim);
      count = count + 1;
    }
  }
  return count;
}