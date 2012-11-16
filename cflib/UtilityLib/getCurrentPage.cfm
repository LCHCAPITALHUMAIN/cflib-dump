function getCurrentPage() {
	var thisPage = spanExcluding(reverse(CGI.SCRIPT_NAME),'/');
	thisPage = reverse(thispage);
	return thisPage;
}