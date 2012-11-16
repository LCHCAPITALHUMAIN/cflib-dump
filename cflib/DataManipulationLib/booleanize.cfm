function booleanize(value) {
	if (not isboolean(value)) {
		value = replacenocase(value,'on',1);
		value = replacenocase(value,'off',0);
	}
	if (yesnoformat(value) eq 'Yes') value = 1;
	if (yesnoformat(value) eq 'No') value = 0;
	return value;
}