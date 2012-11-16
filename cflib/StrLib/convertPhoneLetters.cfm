public string function convertPhoneLetters(required string oldNumber) {
  var newNumber= arguments.oldNumber;
  var regArray= [
    "[A-Ca-c]",
    "[D-Fd-f]",
    "[G-Ig-i]",
    "[J-Lj-l]",
    "[M-Om-o]",
    "[P-Sp-s]",
    "[T-Vt-v]",
    "[W-Zw-z]"
  ];
		
  var resultArray= [
    2,3,4,5,6,7,8,9
  ];
		
  for (var x=1; x <= arrayLen(regArray); x++) {
    newNumber= REReplace(newNumber,regArray[x],resultArray[x],"all");
  }
		
  return newNumber;
}