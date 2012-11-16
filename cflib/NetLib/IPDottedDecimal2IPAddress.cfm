function IPDottedDecimal2IPAddress( ipvalue ) {
	var ipAddress = "";
	var lBitMasks = "24,16,8,0";
	var i = 1;

	for ( ; i LTE 4; i = i + 1 )
	{
		ipAddress = ipAddress & "." & BitMaskRead( ipvalue, ListGetAt( lBitMasks, i ), 8 );
	}
	ipAddress = Right( ipAddress, Len( ipAddress ) - 1 );

	return ipAddress;
}