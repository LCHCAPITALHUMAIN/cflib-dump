function ip4r(ip4) {
	return ReReplaceNoCase(ip4,  "([0-9]{1,3}).([0-9]{1,3}).([0-9]{1,3}).([0-9]{1,3})",  "\4.\3.\2.\1");
}