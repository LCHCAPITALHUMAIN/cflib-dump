function FileIsHidden(filename){
	var _File =  createObject("java", "java.io.File");
	_File.init(JavaCast("string", filename));
	return _File.isHidden();
}