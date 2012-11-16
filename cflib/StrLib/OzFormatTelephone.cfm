function OzFormatTelephone(PhoneNumber) {
    if (not isNumeric(PhoneNumber)) return "";
	if (left(PhoneNumber,1) eq 0) return "(" & left(PhoneNumber, 2) & ")&nbsp;" & mid(PhoneNumber, 4, 4) & "-" & right(PhoneNumber, 4);
	else if (left(PhoneNumber,1) neq 0) return left(PhoneNumber, 4) & "-" & mid(PhoneNumber, 3, 3) & "-" & right(PhoneNumber, 3);
	return "";
}