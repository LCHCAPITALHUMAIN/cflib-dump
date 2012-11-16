function IsHexColor(hexInput) {
  var cleanHexInput = replace(hexInput,'##','','ALL');
  if (Len(ReReplace(cleanHexInput, "[0-9abcdefABCDEF]", "","ALL")) eq 0 and Len(cleanHexInput) gt 5) {
    return True;
  } else {
      return False;
    }
}