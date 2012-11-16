function setThreadPriority(newPriority) {
	var thread = createObject("java", "java.lang.Thread");
	if (arguments.newPriority le thread.max_priority and arguments.newPriority ge thread.min_priority) {
		thread.setPriority(arguments.newPriority);
		return true;
	} else {
		return false;
	}
}