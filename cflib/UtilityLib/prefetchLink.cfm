function prefetchLink(link){
	if(arrayLen(arguments) gte 2) return '<link rel="prefetch" href="#arguments.link#" title="#arguments[2]#" />';
	 return '<link rel="prefetch" href="#arguments.link#">';
}