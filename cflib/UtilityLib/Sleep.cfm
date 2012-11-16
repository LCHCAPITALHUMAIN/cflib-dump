function sleep(ms) {
	var thread = createObject("java", "java.lang.Thread");
	thread.sleep(ms);
}