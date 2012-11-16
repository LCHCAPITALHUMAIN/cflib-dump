function Permutation(n,p)
{
  var RetVal = 0;
  if (p GT n) {
   RetVal = "undefined";
  }
  else
   RetVal = Factorial(n) / Factorial(n-p);  
  Return RetVal;
}