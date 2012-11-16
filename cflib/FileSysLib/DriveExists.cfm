function DriveExists(drive)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  if (fso.DriveExists(drive)){
    Return True;
  }
  else {
    Return False;
  }
}