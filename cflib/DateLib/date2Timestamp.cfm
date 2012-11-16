function date2Timestamp(cfdate) {
	return dateDiff('s',createDate(1970,1,1),cfdate);
}