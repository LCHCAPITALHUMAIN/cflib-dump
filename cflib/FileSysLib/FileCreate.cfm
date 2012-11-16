function FileCreate(filename){
	var force = false;
	var daFile = createObject('java', 'java.io.File');
	
	if(arraylen(arguments) gte 2) force = arguments[2];
	daFile.init(JavaCast('string', filename));
	if(force) daFile.delete();
	daFile.createNewFile();
}