function jumble(str) {
  var tempstring=""; 
  var temp=0;
  while (len(str) gt 0) {
    temp = randrange(1, len(str));
    tempstring = tempstring & mid(str, temp, 1);
    str = removechars(str, temp, 1);
  }
  return tempstring;
}