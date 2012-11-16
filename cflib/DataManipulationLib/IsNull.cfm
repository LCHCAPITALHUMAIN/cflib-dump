function IsNull(val){
  var NullIdentifier = "";
  if (ArrayLen(Arguments) gte 2) 
    NullIdentifier = Arguments[2];
  if (val is NullIdentifier) {
    return True;
  }
  else {
    return False;
  }
}