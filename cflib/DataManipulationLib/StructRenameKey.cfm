function StructRenameKey(struct, key, newkey) {
	// Allow overwriting existing keys or not?
	var AllowOverWrite = false;
	switch (ArrayLen(Arguments)) {
		case "4":
			AllowOverWrite = Arguments[4];
	}

	// No key or keys are the same? Return.
	if (NOT StructKeyExists(struct, key) OR CompareNoCase(key, newkey) EQ 0)
		return struct;

	if (NOT AllowOverWrite AND StructKeyExists(struct, newkey)) {
		// New key already exists and overwriting is off? Return.
		return struct;
	} else {
		// Duplicate and delete old. Return.
		struct[newkey] = Duplicate(struct[key]);
		StructDelete(struct, key);
		return struct;
	}
}