function SetFileAttribute(sFilePath, sAttribute, bOnOff) {
   var result = False;
   var fso = 0;
   var f = 0;
   var iListPosition = 0;
   var iFlagPosition = 0;
   
   if ( FileExists(sFilePath) ) {
     fso = CreateObject("COM", "Scripting.FileSystemObject");
     f = fso.GetFile(sFilePath);
     iListPosition = ListFindNoCase("ReadOnly,Hidden,System,Archive", sAttribute);
     
     if (iListPosition GT 0) {
       iFlagPosition = ListGetAt("0,1,2,5", iListPosition);
       f.attributes = BitMaskSet(f.attributes, IIF(bOnOff, 1, 0), iFlagPosition, 1);
       result = True;
     }
   }
  
   return result;
 }