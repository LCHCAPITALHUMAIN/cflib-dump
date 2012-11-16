function Logic2bit(exp){
 if (IsBoolean(exp)){
  if (exp) return 1;
  if (NOT (exp)) return 0;
}
else return(-1);
}