function FileDateLastModified(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var theFile = fso.GetFile(path);
  Return theFile.DateLastModified;
}