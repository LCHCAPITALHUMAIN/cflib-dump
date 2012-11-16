function Get(BVar,loc) {
	if (isBinary(BVar) EQ "No") return 0;
	if (BVar[loc] GTE 0) return BVar[loc];
	return BVar[loc] + 256;
}