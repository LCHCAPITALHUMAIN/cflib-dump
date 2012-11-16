function Tanh(x){
  var tmp = Exp(2*x);
  return((tmp-1)/(tmp+1));
}