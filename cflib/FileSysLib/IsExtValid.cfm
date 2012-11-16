function IsExtValid(path,extlist) {
	// Find the last dot
	var DotPos = Find(".", Reverse(path));
	// Grab the extension
	var ext = Right(path, 3);
        return (not ((DotPos NEQ 4) OR (NOT ListFindNoCase(extlist, ext))));
}