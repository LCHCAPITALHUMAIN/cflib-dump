function RoundUpDown(input){
  var roundval = 5;
  var direction = "Up";
  var result = 0;

  if(ArrayLen(arguments) GTE 2) 
    roundval = arguments[2];
  if(ArrayLen(arguments) GTE 3) 
    direction = arguments[3];
  if(roundval EQ 0) 
    roundval = 1;

  if((input MOD roundval) NEQ 0){
     if((direction IS 1) OR (direction IS "Up")){
      result = input + (roundval - (input MOD roundval));
     }else{
      result = input - (input MOD roundval);
     }
  }else{
    result = input;
  }
  return result;
}