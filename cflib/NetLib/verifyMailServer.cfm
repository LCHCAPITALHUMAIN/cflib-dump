<cffunction name="verifyMailServer" returntype="struct" access="public" output="true">
	<cfargument name="protocol" type="string" required="true" hint="Mail protocol: SMTP, POP3 or IMAP" />
	<cfargument name="host" type="string" required="true" hint="Mail server name (Example: pop.gmail.com)"/>
	<cfargument name="port" type="numeric" default="-1" hint="Mail server port number. Default is -1, meaning use the default port for this protocol)" />
	<cfargument name="user" type="string" required="true" hint="Mail account username" />
	<cfargument name="password" type="string" required="true" hint="Mail account password" />
	<cfargument name="useSSL" type="boolean" default="false" hint="If true, use SSL (Secure Sockets Layer)" >
	<cfargument name="useTLS" type="boolean" default="false" hint="If true, use TLS (Transport Level Security)" >
	<cfargument name="enforceTLS" type="boolean" default="false" hint="If true, require TLS support" >
	<cfargument name="timeout" type="numeric" default="0" hint="Maximum milliseconds to wait for connection. Default is 0 (wait forever)" />
	<cfargument name="debug" type="boolean" default="false" hint="If true, enable debugging. By default information is sent to is sent to System.out." >
	<cfargument name="logPath" type="string" default="" hint="Send debugging output to this file. Absolute file path. Has no effect if debugging is disabled." >
	<cfargument name="append" type="boolean" default="true" hint="If false, the existing log file will be overwritten" >

	<cfset var status 		= structNew() />
	<cfset var props 		= "" />
	<cfset var mailSession 	= "" />
	<cfset var store 		= "" />
	<cfset var transport	= "" />
	<cfset var logFile		= "" />
	<cfset var fos 			= "" />
	<cfset var ps 			= "" />
	
	<!--- validate protocol --->
	<cfset arguments.protocol = lcase( trim(arguments.protocol) ) />
	<cfif not listFindNocase("pop3,smtp,imap", arguments.protocol)>
		<cfthrow type="IllegalArgument" message="Invalid protocol. Allowed values: POP3, IMAP and SMTP" />
	</cfif>
	
	<cfscript>
		// initialize status messages
		status.wasVerified 	= false;
		status.errorType  	= "";
		status.errorDetail  = "";

		try {
   			props = createObject("java", "java.util.Properties").init();

			// enable security settings
   			if (arguments.useSSL or arguments.useTLS) {

   				// use the secure protocol
   				// this will set the property mail.{protocol}.ssl.enable = true
				if (arguments.useSSL) {
					arguments.protocol = arguments.protocol &"s";			
				}
				
   				// enable identity check (recommended)
   				props.put("mail."& protocol &".ssl.checkserveridentity", "true");

				// enable transport level security and make it mandatory
				// so the connection fails if TLS is not supported
   				if (arguments.useTLS) {
   					props.put("mail."& protocol &".starttls.required", "true");
   					props.put("mail."& protocol &".starttls.enable", "true");
   				}

   			}

			// force authentication command
			props.put("mail."& protocol &".auth", "true");

			// for simple verifications, apply timeout to both socket connection and I/O 
			if (structKeyExists(arguments, "timeout")) {
	   			props.put("mail."& protocol &".connectiontimeout", arguments.timeout);
   				props.put("mail."& protocol &".timeout", arguments.timeout);
			}

	   		// create a new mail session 
    		mailSession = createObject("java", "javax.mail.Session").getInstance( props );

    		// enable debugging
    		if (arguments.debug) {
   				mailSession.setDebug( true );
   				
    			// redirect the output to the given log file
    			if ( len(trim(arguments.logPath)) ) {
    				logFile = createObject("java", "java.io.File").init( arguments.logPath );
   					fos  	= createObject("java", "java.io.FileOutputStream").init( logFile, arguments.overwrite );
   					ps   	= createObject("java", "java.io.PrintStream").init( fos ); 
   					mailSession.setDebugOut( ps );
    			}
    		}
    		
			// Connect to an SMTP server ... 
			if ( left(arguments.protocol, 4) eq "smtp") {

		    		transport = mailSession.getTransport( protocol );
	    			transport.connect(arguments.host, arguments.port, arguments.user, arguments.password);
	    			transport.close();
		    		// if we reached here, the credentials should be verified
					status.wasVerified 	= true;

			}
			// Otherwise, it is a POP3 or IMAP server
			else {

	    			store = mailSession.getStore( protocol );
	    			store.connect(arguments.host, arguments.port, arguments.user, arguments.password);
	    			store.close();
		    		// if we reached here, the credentials should be verified
					status.wasVerified 	= true;

			}     	

	     }
	     //for authentication failures
	     catch(javax.mail.AuthenticationFailedException e) {
	   			status.errorType 	= "Authentication";
	     		status.errorDetail 	= e;
	   	 }
	     // some other failure occurred like a javax.mail.MessagingException
	     catch(Any e) {
	     		status.errorType 	= "Other";
	     		status.errorDetail 	= e;
	     }


	     // always close the stream ( messy work-around for lack of finally clause prior to CF9...)
	     if ( not IsSimpleValue(ps) ) {
		 	ps.close();
	     }

	     return status;
	</cfscript>
</cffunction>