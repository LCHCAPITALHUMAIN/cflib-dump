function fullurlencode(str) {
  var encstr="";
  var len=len(str);
  var i=1;
  for(i=1; i LTE len; i=i+1)
    encstr = encstr & "%" & FormatBaseN(Asc(Mid(str,i,1)),16);
  return encstr;
}