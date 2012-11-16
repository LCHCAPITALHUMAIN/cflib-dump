function IsMSSQLGUID(str) {
	return (reFindNoCase("[0-9a-f]{8,8}-[0-9a-f]{4,4}-[0-9a-f]{4,4}-[0-9a-f]{4,4}-[0-9a-f]{12,12}",str) is 1 and len(str) is 36);

}