<cffunction name="inPolygon" output="false" returntype="boolean" access="public" 
	displayname="In Polygon" hint="I check if a point is inside of a polygon."
	description="I check if the passed in pointX and pointY are inside of a the passed in polygon coordinates.">
	
	<cfargument name="polygonXCoordinates" type="any" default=""
		hint="I am a list of X coordinates that make the polygon. I default to an empty string." />
	<cfargument name="polygonYCoordinates" type="any" default=""
		hint="I am alist of Y coordinates that make the polygon. I default to an empty string." />
	<cfargument name="pointX" type="any" default=""
		hint="I am the x coordinate of the point to check. I default to an empty string." />
	<cfargument name="pointY" type="any" default=""
		hint="I am the y coordinate of the point to check.  I default to an empty string." />
	
	<cfset var polygon = createObject("java", "java.awt.Polygon").init() />
	<cfset var x = 0 />
	
	<cfif listLen(arguments.polygonXCoordinates) neq listLen(arguments.polygonYCoordinates)>
		<cfthrow message="The lenght of the x and y coordinates lists, used to build the Polygon, are not the same length." />
	</cfif>
	
	<!--- create the polygon object --->
	<cfloop from="1" to="#listLen(arguments.polygonXCoordinates)#" index="x">
		<cfset polygon.addPoint(
						javaCast('int', listGetAt(arguments.polygonXCoordinates, x)), 
						javaCast('int', listGetAt(arguments.polygonYCoordinates, x))) />
	</cfloop>
	
	<!--- check if the supplied x/y point is in the polygon --->
	<cfreturn polygon.contains(
						javaCast('int', arguments.pointX), 
						javaCast('int', arguments.pointY)) />
</cffunction>