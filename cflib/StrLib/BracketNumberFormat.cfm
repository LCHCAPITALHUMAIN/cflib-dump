function BracketNumberFormat(myNum) {
   if(myNum eq "") {
    return 0;
    } else {
      if(myNum lt 0)
      {
         return '(' & numberformat(right(myNum, len(myNum)-1)) & ')';
      } else {
         return numberFormat(myNum);
      }
    }
  }