function pluralize(quantity, singular, plural){
	return IIF(quantity EQ 1, DE(singular), DE(plural));
}