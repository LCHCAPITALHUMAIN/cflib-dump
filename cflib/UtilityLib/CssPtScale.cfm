function CssPtScale(size){
	if (http_user_agent DOES NOT CONTAIN "MSIE") return "#val(size+1)#pt";
	else return "#size#pt";
}