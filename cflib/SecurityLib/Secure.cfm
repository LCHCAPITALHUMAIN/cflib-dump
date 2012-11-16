function Secure(model, requiredPermission, userPermissions) {
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
		default: {
			// Define custom validation here.
			permitted = true;
		}
	}
	
	return (permitted);
}