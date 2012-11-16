function verifyEmail(emailAddress){
	// local variables
	var email_address = Trim( arguments.emailaddress );
	var results = StructNew();
	var validationResponse = "";
	var ws = "";
	// add the default keys and values for returned struct 
	results.wsdl = "http://www.webservicex.net/ValidateEmail.asmx?wsdl";
	results.attemptTime = Now();
	// setup the web service
	ws = createObject( "webservice", results.wsdl );
	// ensure, first, that we have a properly formatted email address
	if( IsValid( "email", email_address )) {
		// setup some exception handling just in case the Web Service is down, etc.
		try
		{
			validationResponse = ws.IsValidEmail( Email=email_address );
		}
		catch( Any err )
		{
			results.emailResult = false;
			results.message = "Web Service response error: " + err.Message;
			results.resultCode = "fail";
			// exit the function and return the results struct
			return results;
		}			
		// check the response from the web service
		if( Ucase(Trim( validationResponse )) is "YES" )
		{
			results.emailResult = true;
			results.message = "Email address passed validation and verification.";
			results.resultCode = "valid";
		}
		else
		{
			results.emailResult = false;
			results.message = "Email address passed validation but failed verification.";
			results.resultCode = "invalid";
		}
	}
	else
	{
		results.emailResult = false;
		results.message = "Email address failed validation. It is not properly formatted.";
		results.resultCode = "invalid";
	}
	return results;
}