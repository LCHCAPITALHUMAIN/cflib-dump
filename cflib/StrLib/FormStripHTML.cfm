function FormStripHTML() {
	var nostrip = "";
	if(arraylen(Arguments)) nostrip = Arguments[1];

        if(structIsEmpty(form)) return;

	for (field in form) {
   		if(NOT listfindnocase(nostrip, field)) form[field] = ReReplaceNoCase(form[field], "<[^>]*>", "", "ALL");
	}

        return true;
}