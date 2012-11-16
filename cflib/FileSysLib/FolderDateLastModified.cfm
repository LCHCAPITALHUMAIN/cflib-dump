function FolderDateLastModified(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var folder = fso.GetFolder(path);
  Return folder.DateLastModified;
}