function ErlangB(erl,n) {
	var s=1;
	var i=1;
	for (i=1; i LTE n; i=i+1) s=s*i/erl+1;
	return (1/s);
}