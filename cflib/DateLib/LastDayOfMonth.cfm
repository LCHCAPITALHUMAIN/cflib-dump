function LastDayOfMonth(strMonth) {
  var strYear=Year(Now());
  if (ArrayLen(Arguments) gt 1)
    strYear=Arguments[2];
  return DateAdd("d", -1, DateAdd("m", 1, CreateDate(strYear, strMonth, 1)));
}