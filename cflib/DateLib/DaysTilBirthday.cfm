function DaysTilBirthday(birthdate) {
  var daysRemaining = "";
  if (DateFormat(now(), "MMDD") GT DateFormat(birthdate, "MMDD")) 
    daysRemaining = Int(CreateDate(DatePart("yyyy", now() + 365), DatePart("m", birthdate), DatePart("d", birthdate)) - now() + 1);
  else 
    daysRemaining = Int(CreateDate(DatePart("yyyy", now()), DatePart("m", birthdate), DatePart("d", birthdate)) - now() + 1);
  Return daysRemaining;
}