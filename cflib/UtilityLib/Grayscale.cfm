function Grayscale(hex_color) {
  // strip out any leading pound signs
  var clean_hex = replace(hex_color,'##','','ALL');
  // parse out rgb values, convert them to decimal, and make into a list
  var rgb = InputBaseN(Left(clean_hex,2),16) & "," & InputBaseN(Mid(clean_hex,3,2),16) & "," & InputBaseN(Right(clean_hex,2),16);
  // find average value from the list
  var gray = ArrayAvg(ListToArray(rgb));
  // check to see if a web_safe result is preferred
  if ((ArrayLen(Arguments) GT 1) AND Arguments[2])
    gray = Round(gray / 51) * 51;

  // convert gray to hexadecimal and pad with a zero if necessary
  gray = FormatBaseN(gray,16);
  if (len(gray) is 1) gray = "0" & gray;
    // return gray value as a new 6-digit hex color
    return gray & gray & gray;
}