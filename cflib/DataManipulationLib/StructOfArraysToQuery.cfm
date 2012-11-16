function StructOfArraysToQuery(thestruct){
   var fieldlist = structkeylist(thestruct);
   var numrows   = arraylen( thestruct[listfirst(fieldlist)] );
   var thequery  = querynew(fieldlist);
   var fieldname="";
   var thevalue="";
   var row=1;
   var col=1;
   for(row=1; row lte numrows; row = row + 1)
   {
      queryaddrow(thequery);
      for(col=1; col lte listlen(fieldlist); col = col + 1)
      {
	 fieldname = listgetat(fieldlist,col);
	 thevalue  = thestruct[fieldname][row];
	 querysetcell(thequery,fieldname,thevalue);
      }
   }
return(thequery); }