function getFirstDateThisQuarter() {
	if(now() gte createDateTime(DatePart("yyyy", now()), 01, 01, 00, 00, 00) and now() lte createDateTime(DatePart("yyyy", now()), 03, 31, 23, 59, 59)) return createDate(datePart("yyyy", now()), 01, 01);
	else if (now() gte createDateTime(DatePart("yyyy", now()), 04, 01, 00, 00, 00) and now() lte createDateTime(DatePart("yyyy", now()), 06, 30, 23, 59, 59)) return createDate(datePart("yyyy", now()), 04, 01);
	else if (now() gte createDateTime(DatePart("yyyy", now()), 07, 01, 00, 00, 00) and now() lte createDateTime(DatePart("yyyy", now()), 09, 30, 23, 59, 59)) return createDate(datePart("yyyy", now()), 07, 01);
	else return createDate(datePart("yyyy", now()), 10, 01);
}