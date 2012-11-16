function getISBN(BarCodeNum) {
  var x ='';
  var sum = 0;
  var i = 0;
  var digitsum = 0;
  var ModSum=0;

  // Barcode Must be 13 digits AND numeric 
  if(len(BarCodeNum) NEQ  13) return 0;
  if(not IsNumeric(BarCodeNum)) return 0;
  /** get rid of first 3 characters since they are  NOT used for conversion **/
  x = right(BarCodeNum,10);
  x = left(x,9);
  // loop through middle 9 digits
  for(i = 1; i LTE 9; i = i + 1) {
       digitsum = Mid( x, i, 1 ) * i;
       sum = sum + digitsum;
  }
  // check for the last letter/digit
  ModSum = sum MOD 11;
  if(ModSum EQ 10) ModSum = "x";
  return x & ModSum;
}