function makeDirs(p){
	createObject("java", "java.io.File").init(p).mkdirs();
}