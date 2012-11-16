function StructToQueryString(struct) {
  var qstr = "";
  var delim1 = "=";
  var delim2 = "&";

  switch (ArrayLen(Arguments)) {
    case "3":
      delim2 = Arguments[3];
    case "2":
      delim1 = Arguments[2];
  }
	
  for (key in struct) {
    qstr = ListAppend(qstr, URLEncodedFormat(LCase(key)) & delim1 & URLEncodedFormat(struct[key]), delim2);
  }
  return qstr;
}