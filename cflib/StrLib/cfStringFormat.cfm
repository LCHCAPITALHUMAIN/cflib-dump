function cfStringFormat(mystring) { 
	var x = 0; 
	var npc = ""; 
	var npcc = ""; 

	mystring = rereplacenocase(mystring,"(""|##)","\1\1","ALL"); 
	for (x = 1; x lte 31; x = x + 1) { 
		npc = listappend(npc,chr(x)); 
		npcc = listappend(npcc,"##chr(#x#)##"); 
	} 
	return replacelist(mystring,npc,npcc); 
}