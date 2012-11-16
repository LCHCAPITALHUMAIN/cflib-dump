function MySQLTS2DT(timestamp) {
	return CreateDateTime(Left(timestamp,4),Mid(timestamp,5,2),Mid(timestamp,7,2),Mid(timestamp,9,2),Mid(timestamp,11,2),Mid(timestamp,13,2));
}