function FormatSSN(str)
{
  var SSN = "";
  if (Not IsNumeric(str)) return "Error, str must be numeric";
  if (Len(Str) NEQ 9) return "Error, str must be 9 digits long";
  SSN = ReReplace(str,'([0-9]{3})([0-9]{2})([0-9]{4})','\1-\2-\3');
  return SSN;
}