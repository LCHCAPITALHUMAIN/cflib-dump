function PadStringToLen(string, char, count)
{
  var strLen = len(string);
  var padLen = count - strLen;
  if (padLen lte 0) {
    return string;
  }
  else {
    return RepeatString(char, padLen) & string;
  }
}