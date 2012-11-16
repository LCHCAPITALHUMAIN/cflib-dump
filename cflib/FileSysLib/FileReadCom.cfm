function ReadFileCom(sPath){
	var fileContent="";
	var oFSO=CreateObject("COM", "Scripting.FileSystemObject");
	var oFile=oFSO.OpenTextFile(sPath, 1, 0, 0);

	fileContent=oFile.ReadAll();
	oFile.Close();

	return fileContent;
}