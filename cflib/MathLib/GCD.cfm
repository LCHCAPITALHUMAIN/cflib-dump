function GCD(int1, int2)
{
  Var ShowWork=False;
  If (ArrayLen(Arguments) eq 3 AND Arguments[3] eq "yes"){
    ShowWork=True;
  }
   
  // if both numbers are 0 return undefined
  if (int1 eq 0 and int2 eq 0) return 'Undefined';

  // if both numbers are equal or either one of them is equal to 0 
  // then return any 1 of those numbers appropriately
  if (int1 eq int2 or int2 eq 0) return int1;
  if (int1 eq 0) return int2;

  // if int2 divides int1 "properly" then we have reached our final 
  //   step. So we output the last step and exit the function.
  if (int1 mod int2 eq 0) {
    if(ShowWork EQ True) {
      WriteOutput("<br>"&int1&"= "&fix(int1/int2)&" X "&int2&" + "&int1 mod int2); 
    }
    // this line outputs the last iteration
    if (ShowWork EQ True) {
      return "<p>GCD = "&int2; //print the GCD
    }
    else{
      return int2;
    }
  }

  // if int2 does not divides int1 "properly" then we recurse using
  // int1 equal to int2 and int2 equal to int1 mod int2
  else {
    if(ShowWork EQ True)
      // this line outputs calculations from each iteration. you can safely
      // delete/comment out this line if you dont need to display the steps.
      WriteOutput("<br>"&int1&"= "&fix(int1/int2)&" X "&int2&" + "&int1 mod int2); 
  }
  //since we still have not reached the last step we recall the function 		
  //(recurse)
  GCD(int2, int1 mod int2, ShowWork);
}