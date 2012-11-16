function FileSetReadOnly(filename){
	var _File =  createObject("java", "java.io.File");
	_File.init(JavaCast("string", filename));
	_File.setReadOnly();
}