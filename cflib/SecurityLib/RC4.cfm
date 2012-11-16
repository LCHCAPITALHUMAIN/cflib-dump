function RC4(strPwd,plaintxt) {
	var sbox = ArrayNew(1);
	var key = ArrayNew(1);
	var tempSwap = 0;
	var a = 0;
	var b = 0;
	var intLength = len(strPwd);
	var temp = 0;
	var i = 0;
	var j = 0;
	var k = 0;
	var cipherby = 0;
	var cipher = "";
	
	for(a=0; a lte 255; a=a+1) {	
		key[a + 1] = asc(mid(strPwd,(a MOD intLength)+1,1));
		sbox[a + 1] = a;
	}

	for(a=0; a lte 255; a=a+1) {	
		b = (b + sbox[a + 1] + key[a + 1]) Mod 256;		
		tempSwap = sbox[a + 1];
		sbox[a + 1] = sbox[b + 1];
		sbox[b + 1] = tempSwap;    
	}

	for(a=1; a lte len(plaintxt); a=a+1) {	
		i = (i + 1) mod 256;
		j = (j + sbox[i + 1]) Mod 256;		
		temp = sbox[i + 1];
		sbox[i + 1] = sbox[j + 1];
		sbox[j + 1] = temp;
		k = sbox[((sbox[i + 1] + sbox[j + 1]) mod 256) + 1];		
		cipherby = BitXor(asc(mid(plaintxt, a, 1)), k);
		cipher = cipher & chr(cipherby);  		
	}
	return cipher;
}