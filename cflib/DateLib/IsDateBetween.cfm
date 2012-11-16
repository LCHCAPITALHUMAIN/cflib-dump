function IsDateBetween(dateObj, dateCompared1, dateCompared2)
{
 return YesNoFormat((DateCompare(dateObj, dateCompared1) gt -1) AND (DateCompare(dateObj, dateCompared2) lt 1));
}