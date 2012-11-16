function FolderExists(folder)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  if (fso.FolderExists(folder)){
    Return True;
  }
  else {
    Return False;
  }
}