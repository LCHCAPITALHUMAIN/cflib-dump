function GetFileCount(dir) {
	var fsobj = "";
	var foldr = "";
	var b = "";
	
	if (DirectoryExists(dir)) {
		fsobj = CreateObject("COM", "Scripting.FileSystemObject");
		foldr = fsobj.GetFolder(dir);
		b = foldr.Files;	// CF 5 does not support nested dot notation.
		return b.Count;
	} else {
		return -1;
	}
}