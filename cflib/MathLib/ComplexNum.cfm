function ComplexNum(Real,Imaginary) {
  var ComplexNumber = StructNew();
  ComplexNumber.R=Real;
  ComplexNumber.I=Imaginary;
  return ComplexNumber;
}