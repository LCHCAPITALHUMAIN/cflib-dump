function isRightTriangle(x,y,z){
  // Sort the side lengths from smallest to largest
  ArraySort(Arguments,"Numeric");
  // Use the familiar Pythagorian theorem (a^2+B^2=C^2) to determine if this is a right triangle
  Return (Arguments[1]^2 + Arguments[2]^2) EQ Arguments[3]^2;
}