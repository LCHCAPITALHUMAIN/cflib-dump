function parsepopsubject(subj){
	var re = "=\?([^?]+)\?([BbQq])\?([^?]+)\?=";
	var re2 ="=([[:xdigit:]]{2})";
	var tmp = refind(re,subj,1,true);
	var obj = structnew();
	var type = "";
	var start = 1;
	var eos = false;
	var tmp2 = "";
	var newch = "";
	if (arraylen(tmp.pos) NEQ 4){
		obj.subject = subj;
		obj.encoding = "";
		return obj;
	}
	obj.encoding = mid(subj,tmp.pos[2],tmp.len[2]);
	obj.subject = mid(subj,tmp.pos[4],tmp.len[4]);
	type = mid(subj,tmp.pos[3],tmp.len[3]);
	switch (type){
		case "b":{
			obj.subject = tostring(tobinary(obj.subject));
			break;
		}
		case "q":{
			while (NOT eos){
				obj.subject = replace(obj.subject,"_"," ","ALL");
				tmp2 = refind(re2,obj.subject,start,true);
				if (tmp2.pos[1]){
					newch = chr(inputbasen(mid(obj.subject,tmp2.pos[2],tmp2.len[2]),16));
					obj.subject = removechars(obj.subject,tmp2.pos[1],tmp2.len[1]);
					obj.subject = insert(newch,obj.subject,tmp2.pos[1]-1);
					start = tmp2.pos[2];
				}
				else {
					eos = true;
				}
			}
			break;
		}
	}
	return obj;
}