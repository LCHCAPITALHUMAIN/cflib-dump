function EmailAntiSpam(EmailAddress) {
	var i = 1;
	var antiSpam = "";
	for (i=1; i LTE len(EmailAddress); i=i+1) {
		antiSpam = antiSpam & "&##" & asc(mid(EmailAddress,i,1)) & ";";
	}
	if ((ArrayLen(Arguments) eq 2) AND (Arguments[2] is "Yes")) return "<a href=" & "mailto:" & antiSpam & ">" & antiSpam & "</a>"; 
	else return antiSpam;
}