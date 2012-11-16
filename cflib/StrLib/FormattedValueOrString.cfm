function FormattedValueOrString(begin_str, str, end_str, default_str) {
	if (str IS "") return default_str;
	return begin_str & str & end_str;
}