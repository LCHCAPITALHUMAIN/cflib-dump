function SetReadOnly(sFilePath, bReadOnly) {
   return setFileAttribute(sFilePath, "ReadOnly", bReadOnly);
 };