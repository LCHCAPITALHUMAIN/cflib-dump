function IsHomeCircuit(){
	var baseDir=getDirectoryFromPath(getBaseTemplatePath());
	var currDir=getDirectoryFromPath(getCurrentTemplatePath());

	if(baseDir is currDir) return true;
	else return false;
}