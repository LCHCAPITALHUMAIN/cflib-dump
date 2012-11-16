function GetAlphabetPosition(charornum) {
  var a_numeric = asc("a");
  charornum = lCase(trim(charornum));

  if(isNumeric(charornum)) {
      if(charornum lte 0 OR charornum gte 27) return "";
      return chr(charornum+a_numeric-1);
  } else {
      if(len(charornum) gt 1) return "";
      if(REFind("[^a-z]",charornum)) return "";
      return asc(charornum) - a_numeric + 1;
  }
  return 1;
}