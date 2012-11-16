<cffunction name="sendUDP" access="private" returntype="string" output="false">
	<cfargument name="host" type="string" required="yes" hint="Host to send the UDP">
	<cfargument name="port" type="numeric" required="yes" hint="Port to send the UDP">
	<cfargument name="message" type="string" required="yes"  hint="The message to transmit">

	<cfset var text = arguments.message />
	<cfset var msg = arraynew(1) />
	
	<cfset var i = 0>
	<cfloop index="i" from="1" to="#len(text)#">
		<cfset msg[i] = asc( Mid(text, i, 1) ) />
	</cfloop>
	<!--- Get the internet address of the specified host --->
	<cfset address = createObject("java", "java.net.InetAddress").getByName(arguments.host) />
	
	<!--- Initialize a datagram packet with data and address --->
	<cfset packet = createObject("java", "java.net.DatagramPacket").init( javacast("byte[]",msg), 
																		  javacast("int",arrayLen(msg)), 
																		  address, 
																		  javacast("int",arguments.port)) />
																		  
	<!--- Create a datagram socket, send the packet through it, close it. --->
	<cfset dsocket = createObject("java", "java.net.DatagramSocket") />	
	<cfset dsocket.send(packet) />
	<cfset dsocket.close() />

</cffunction>