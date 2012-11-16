function IPConvert(val) {
	var int = '';
	var ip = arraynew(1);
	if (find('.',val))
		{
		int = 0;
		int = ListGetAt(val, 1, ".") * 256^3;
		int = int + ListGetAt(val, 2, ".") * 256^2;
		int = int + ListGetAt(val, 3, ".") * 256;
		int = int + ListGetAt(val, 4, ".");
		return int;
		}
	else
		{
		int = val;
		ip[1] = Int(int / 256^3);
		int = int - (ip[1] * 256^3);
		ip[2] = int(int / 256^2);
		int = int - (ip[2] * 256^2);
		ip[3] = int(int / 256);
		ip[4] = int - (ip[3] * 256);
		ip = ip[1] & "." & ip[2] & "." & ip[3] & "." & ip[4];
		return ip;
		}
}