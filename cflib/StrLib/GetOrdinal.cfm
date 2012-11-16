function GetOrdinal(num) {
  // if the right 2 digits are 11, 12, or 13, set num to them.
  // Otherwise we just want the digit in the one's place.
  var two=Right(num,2);
  var ordinal="";
  switch(two) {
       case "11": 
       case "12": 
       case "13": { num = two; break; }
       default: { num = Right(num,1); break; }
  }

  // 1st, 2nd, 3rd, everything else is "th"
  switch(num) {
       case "1": { ordinal = "st"; break; }
       case "2": { ordinal = "nd"; break; }
       case "3": { ordinal = "rd"; break; }
       default: { ordinal = "th"; break; }
  }

  // return the text.
  return ordinal;
}