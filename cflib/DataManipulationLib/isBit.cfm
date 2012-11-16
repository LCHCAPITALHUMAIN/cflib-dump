function isBit(x){
   if(isSimpleValue(x) and len(x) eq 1 and (x eq 0 or x eq 1))
      return true;
   else
      return false;
}