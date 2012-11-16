function HexToRGB(hexColor){
  /* Strip out poundsigns. */
  Var tHexColor = replace(hexColor,'##','','ALL');
	
  /* Establish vairable for RGB color. */
  Var RGBlist='';
  Var RGPpart='';	

  /* Initialize i */
  Var i=0;

  /* Loop through each hex triplet */
  for (i=1; i lte 5; i=i+2){
    RGBpart = InputBaseN(mid(tHexColor,i,2),16);
    RGBlist = listAppend(RGBlist,RGBpart);
  }
  return RGBlist;
}