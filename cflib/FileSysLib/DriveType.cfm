function DriveType(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  //evaluate the drive type
  switch(drive.DriveType){
    case 0: 
    {
      Return "Unknown";
      break;
    }
    case 1: 
    {
      Return "Removable";
      break;
    }    
    case 2: 
    {
      Return "Fixed";
      break;
    }
    case 3: 
    {
      Return "Network";
      break;
    }
    case 4: 
    {
      Return "CD-ROM";
      break;
    }
    case 5: 
    {
      Return "RAM Disk";
      break;
    }
  }
}