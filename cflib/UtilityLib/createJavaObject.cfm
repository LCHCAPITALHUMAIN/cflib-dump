function createJavaObject(directory){
	var URLObject = createObject("java", "java.net.URL");
	var ArrayClass = createObject("java","java.lang.reflect.Array");
	var loader = createObject("java","java.net.URLClassLoader");
	var URLArray = "";
	
	directory = replace(expandPath(directory), "\", "/", "all");		
	URLObject.init("file:" & directory);
	URLArray = createObject("java", "java.lang.reflect.Array").newInstance(URLObject.getClass(), 1);
		
	ArrayClass.set(URLArray,0,URLObject);
	return loader.init(URLArray);
}