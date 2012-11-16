function isIncluded(){
	IF (getCurrentTemplatePath() NEQ getBaseTemplatePath()) return true;
	else return false;
}