function closestWebSafeColor(hexInput) {
  var cleanHexInput = replace(hexInput,'##','','ALL');
  var hexOutput = '';
  var i = 0;
  if (Len(ReReplace(cleanHexInput, "[0-9abcdefABCDEF]", "","ALL")) eq 0 and Len(cleanHexInput) eq 6) {
    for (i=1; i lte 5; i=i+2) {
      closestMatch = 51 * Round((InputBaseN(mid(cleanHexInput,i,2),16)/51));
      if (closestMatch eq 0) {
        hexOutput = hexOutput & '00';
	} 
      else {
        hexOutput = hexOutput & FormatBaseN(closestMatch,16);
      }
    }
    return hexOutput;
  } 
  else {
    return 'invalid';
  }
}