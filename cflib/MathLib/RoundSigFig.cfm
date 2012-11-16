function RoundSigFig(fInput, iDigits) 
{
  //Local Variables
  var iLog = 0;
  var iTemp = 0;
  var fReturn = 0;

  //Execution
  if (fInput NEQ 0) { //If not zero round to significant digits.
    iLog=Int(Log10(Sgn(fInput)*fInput+0.0));
    iTemp=Round(fInput / (10^(iLog-iDigits+1)));
    //return(Log10(fInput+0.0)); //Debugging
    fReturn=evaluate(iTemp*(10^(iLog-iDigits+1)));
  } //End (Round to significant digits.)
  Return(fReturn);
} //End (RSigFig)