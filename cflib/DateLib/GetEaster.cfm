function GetEaster() {
  Var TheYear=iif(arraylen(arguments) gt 0,"arguments[1]", "Year(Now())");       
  Var century = Int(TheYear/100);
  Var G = TheYear MOD 19;
  Var K = Int((century - 17)/25);
  Var I = (century - Int(century/4) - Int((century - K)/3) + 19*G + 15) MOD 30;
  Var H = I - Int((I/28))*(1 - Int((I/28))*Int((29/(I + 1)))*Int(((21 - G)/11)));
  Var J = (TheYear + Int(TheYear/4) + H + 2 - century + Int(century/4)) MOD 7;
  Var L = H - J;
  Var EasterMonth = 3 + Int((L + 40)/44);
  Var EasterDay = L + 28 - 31*Int((EasterMonth/4));
  return CreateDate(TheYear,EasterMonth,EasterDay);
}