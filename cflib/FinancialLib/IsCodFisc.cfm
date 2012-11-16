function IsCodFisc(codFisc) {
	return ReFind("^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$", trim(codFisc));
}