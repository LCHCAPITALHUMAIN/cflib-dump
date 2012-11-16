function IsWebSafeColor(hexColor){
  /* Establish list of web safe colors */
  Var safeList = "00,33,66,99,cc,ff";
	
  /* Strip out poundsigns from argument. */
  Var tHexColor = replace(hexColor,'##','','ALL');

  /* Initialize i */
  Var i=0;
  
  /* Loop over r,g,b hex values */
  for (i=1; i lte 5; i=i+2){
		
    /* Set result to FALSE if a color isn't web safe. */	
    if (listFindNoCase(safeList,mid(tHexColor,i,2)) eq 0){
      return False;
    }
  }
  return True;
}