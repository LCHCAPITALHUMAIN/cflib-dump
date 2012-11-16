function trimFalseEmailHeaders(str) {
	str = replaceNoCase(str, "Content-Type:", "content-type;", "ALL" );
	str = replaceNoCase(str, "MIME-Version:", "mime-version;", "ALL" );
	str = replaceNoCase(str, "To: ", "to; ", "ALL" );
	str = replaceNoCase(str, "From: ", "from; ", "ALL" );
	str = replaceNoCase(str, "bcc: ", "bcc; ", "ALL" );
	str = replaceNoCase(str, "Subject: ", "subject; ", "ALL" );
	return str;
}