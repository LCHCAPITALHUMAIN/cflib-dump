function SetVolumeName(drvPath, newName)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  drive.VolumeName = newName;
  Return True;
}