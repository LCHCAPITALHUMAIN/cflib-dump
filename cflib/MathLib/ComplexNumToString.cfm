function ComplexNumToString(ComplexNumber) {
  if ( ComplexNumber.I LT 0 )
    return "#ComplexNumber.R# - #Abs(ComplexNumber.I)#i";
  else		
    return "#ComplexNumber.R# + #ComplexNumber.I#i";
}