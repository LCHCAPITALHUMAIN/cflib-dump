function GetNumbers(textstr) {
  if (arraylen(arguments) GTE 2) { 
    return REReplace(textstr,"[^0-9\.]",'','ALL'); }
  else { 
    return REReplace(textstr,"[^0-9]",'','ALL');  }
}