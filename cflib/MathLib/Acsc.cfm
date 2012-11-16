function Acsc(x){
  if (x eq 0)
    return "undefined";
  else
    return Atn(1/Sqr(x*x-1))+(Sgn(x)-1)*1.570796;
}