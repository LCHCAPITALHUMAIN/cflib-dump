function SecureMX(model, requiredPermission, userPermissions) {
	var permitted = false;
	// Switch to appropriate security model
	switch( model ) {
		// Bit Validation
		case "bit":
		{
			if ( BitAnd( userPermissions, requiredPermission ) ) {
				permitted = true;
			}
			break;
		}
		// List Validation
		case "list":
		{
			if ( ListFindNoCase( userPermissions, requiredPermission ) ) {
				permitted = true;
			}
			break;
		}
		// Define custom validation here
		default:
		{
			include( model & ".cfm" );
			permitted = true;
		}
	}
	
	// If not permitted and an Exit FuseAction is defined
	if ( NOT permitted and isDefined( "attributes.failureXFA" ) ) {
		location( "#request.self#?fuseaction=#attributes.failureXFA#", 1 );
	}
	
	return (permitted);
}