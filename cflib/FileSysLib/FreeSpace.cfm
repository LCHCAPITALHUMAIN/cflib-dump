function FreeSpace(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.FreeSpace;
}