function Combination(n,p)
{
  var RetVal = 0;
  if (p GT n) {
   RetVal = "undefined";
  }
  else
   RetVal = Permutation(n,p) / Factorial(p);  
  Return RetVal;
}