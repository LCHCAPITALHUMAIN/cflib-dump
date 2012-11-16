function PadString(string, char, count)
{
  var Padding = RepeatString(char, count);
  return Padding & string;
}