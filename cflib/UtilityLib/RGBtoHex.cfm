function RGBtoHex(r,g,b){
  Var hexColor="";
  Var hexPart = '';
  Var i=0;
	
  /* Loop through the Arguments array, containing the RGB triplets */
  for (i=1; i lte 3; i=i+1){
    /* Derive hex color part */
    hexPart = formatBaseN(Arguments[i],16);
		
    /* Pad with "0" if needed */
    if (len(hexPart) eq 1){
      hexPart = '0' & hexPart;	
    } 
		
    /* Add hex color part to hexadecimal color string */
    hexColor = hexColor & hexPart;
  }
  return hexColor;
}