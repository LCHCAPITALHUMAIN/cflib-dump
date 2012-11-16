function IPAddress2IPDottedDecimal( ipAddress ) {
	var	ipValue = 0;
	var lBitShifts = "24,16,8,0";
	var i = 1;

	if ( ListLen( ipAddress, "." ) EQ 4 )
	{
		for ( ; i LTE 4; i = i + 1 )
		{
			ipValue = ipValue + BitSHLN( ListGetAt( ipAddress, i, "." ), ListGetAt( lBitShifts, i ) );
		}
	}

	return ipValue;
}