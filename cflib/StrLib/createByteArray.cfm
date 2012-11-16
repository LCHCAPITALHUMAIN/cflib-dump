function createByteArray(string){
	var objString = createObject("Java", "java.lang.String").init(JavaCast("string", string));
	return objString.getBytes();
}