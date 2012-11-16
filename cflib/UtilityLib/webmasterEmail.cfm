function webmaster_email(input) {
    if(left(input,4) eq "http") return "webmaster@" & listRest(listGetAt(input,2,"/"),".");
    else return "webmaster@" & listRest(listFirst(input,"/"),".");
}