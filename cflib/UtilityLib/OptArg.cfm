function OptArg( args, index ) {
	if( arrayLen( args ) GTE index ) {
		return args[ index ];
	} else if( arrayLen( arguments ) IS 3 ) {
		return arguments[ 3 ];
	} else {
		return "";
	}
}