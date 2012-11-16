function viewCSS(cssCode) {
	var i ="";
	var cssItem="";
	var ret="";
	for(i=1;i lte listlen(arguments.cssCode,'}');i=i+1) {
		cssItem = listgetAt(arguments.cssCode,i,'}');
		if(findNocase('{',cssItem)) ret = ret & '<div style="#trim(mid(cssItem,findNocase("{",cssItem)+1,len(cssItem)))#">#trim(mid(cssItem,1,findNocase("{",cssItem)-1))#</div><br>';
	}
	return ret;
}