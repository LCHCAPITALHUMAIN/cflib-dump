function FileDateCreated(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var theFile = fso.Getfile(path);
  Return theFile.DateCreated;
}