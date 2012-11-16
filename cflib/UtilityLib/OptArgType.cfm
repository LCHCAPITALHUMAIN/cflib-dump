function OptArgType( args, index, type ) {
	if( arrayLen( args ) GTE index AND typeOf( args[ index ] ) IS type ) {
		return args[ index ];
	} else if( arrayLen( arguments ) IS 4 ) {
		return arguments[ 4 ];
	} else {
		switch( type ) {
			case "structure" : return structNew();
			case "array" : return arrayNew( 1 );
			default : return "";
		}
	}
}