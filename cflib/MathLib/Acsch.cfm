function Acsch(x){
  if (x EQ 0)
    return "undefined";
  else 
    return Log((Sgn(x)*Sqr(x*x+1)+1)/x);
}