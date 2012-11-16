function WAPSafe(string) {
        string = Replace(string, "&", "&amp;", "ALL");
	return Replace(string, "$", "$$", "ALL");
}