function isVIN(v) {
	var i = "";
	var d = "";
	var f = "";
	var p = "";
	var cd = "";
	var LL	= "A,B,C,D,E,F,G,H,J,K,L,M,N,P,R,S,T,U,V,W,X,Y,Z";
	var VL	= "1,2,3,4,5,6,7,8,1,2,3,4,5,7,9,2,3,4,5,6,7,8,9";
	var FL	= "8,7,6,5,4,3,2,10,0,9,8,7,6,5,4,3,2";
	var rs	= 0;
	
	if(len(v) != 17) {return false;}
	for(i = 1; i <= 17; i++){
		f = ListGetAt(FL, i);
		d = Mid(v,i,1);
		if(IsNumeric(d)){
			d *= f;
		}
		else{
			p = ListFindNoCase(LL,d);
			d = ListGetAt(VL,p);
			d *= f;
		}
		rs += d;
	}
	cd = rs % 10;
	if(cd == 0){cd = "x";}
	if(cd == Mid(v,9,1)){return true;}
	return false;
}