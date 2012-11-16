<cffunction name="queryTreeSort" returntype="query" output="No">
	<cfargument name="Stuff" type="query" required="Yes">
	<cfargument name="ParentID" type="string" required="No" default="ParentID">
	<cfargument name="ItemID" type="string" required="No" default="ItemID">
	<cfargument name="BaseDepth" type="numeric" required="No" default="0">
	<cfargument name="DepthName" type="string" required="No" default="TreeDepth">
	<cfset var RowFromID=StructNew()>
	<cfset var ChildrenFromID=StructNew()>
	<cfset var RootItems=ArrayNew(1)>
	<cfset var Depth=ArrayNew(1)>
	<cfset var ThisID=0>
	<cfset var ThisDepth=0>
	<cfset var RowID=0>
	<cfset var ChildrenIDs="">
	<cfset var ColName="">
	<cfset var Ret=QueryNew(ListAppend(Stuff.ColumnList,Arguments.DepthName))>
	<!--- Set up all of our indexing --->
	<cfloop query="Stuff">
		<cfset RowFromID[Stuff[Arguments.ItemID][Stuff.CurrentRow]]=CurrentRow>
		<cfif NOT StructKeyExists(ChildrenFromID, Stuff[Arguments.ParentID][Stuff.CurrentRow])>
			<cfset ChildrenFromID[Stuff[Arguments.ParentID][Stuff.CurrentRow]]=ArrayNew(1)>
		</cfif>
		<cfset ArrayAppend(ChildrenFromID[Stuff[Arguments.ParentID][Stuff.CurrentRow]], Stuff[Arguments.ItemID][Stuff.CurrentRow])>
	</cfloop>
	<!--- Find parents without rows --->
	<cfloop query="Stuff">
		<cfif NOT StructKeyExists(RowFromID, Stuff[Arguments.ParentID][Stuff.CurrentRow])>
			<cfset ArrayAppend(RootItems, Stuff[Arguments.ItemID][Stuff.CurrentRow])>
			<cfset ArrayAppend(Depth, Arguments.BaseDepth)>
		</cfif>
	</cfloop>
	<!--- Do the deed --->
	<cfloop condition="ArrayLen(RootItems) GT 0">
		<cfset ThisID=RootItems[1]>
		<cfset ArrayDeleteAt(RootItems, 1)>
		<cfset ThisDepth=Depth[1]>
		<cfset ArrayDeleteAt(Depth, 1)>
		<cfif StructKeyExists(RowFromID, ThisID)>
			<!--- Add this row to the query --->
			<cfset RowID=RowFromID[ThisID]>
			<cfset QueryAddRow(Ret)>
			<cfset QuerySetCell(Ret, Arguments.DepthName, ThisDepth)>
			<cfloop list="#Stuff.ColumnList#" index="ColName">
				<cfset QuerySetCell(Ret, ColName, Stuff[ColName][RowID])>
			</cfloop>
		</cfif>
		<cfif StructKeyExists(ChildrenFromID, ThisID)>
			<!--- Push children into the stack --->
			<cfset ChildrenIDs=ChildrenFromID[ThisID]>
			<cfloop from="#ArrayLen(ChildrenIDs)#" to="1" step="-1" index="i">
				<cfset ArrayPrepend(RootItems, ChildrenIDs[i])>
				<cfset ArrayPrepend(Depth, ThisDepth + 1)>
			</cfloop>
		</cfif>
	</cfloop>
	<cfreturn Ret>
</cffunction>