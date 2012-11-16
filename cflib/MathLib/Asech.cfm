function Asech(x){
  if (x lte 0)
    return "undefined";
  else 
    if (x gt 1)
      return "undefined";
  else
    return Log((Sqr(-x*x+1)+1)/x);
}