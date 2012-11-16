function isOldEnough(dob,minAge) {
	var goldenDate = dateAdd('yyyy', -minAge, now());
	if (datecompare(goldenDate,dob) gt 0) return true;
	else return false;
}