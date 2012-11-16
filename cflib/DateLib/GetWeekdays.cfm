<cffunction name="GetWeekdays" returntype="array" output="false">
	<cfargument  name="startDate" default="2007/08/23">
	<cfargument name="endDate" default="2007/09/06">	
	<cfscript>
		//Total number of days to display
		var numOfDays = DateDiff("d",arguments.startDate,arguments.endDate) +2;
		
		//Array to hold text and value fields for select options
		var dateArray = arraynew(2);
		var i = "";
		
		//Populate array with date information
		for(i=1;i lt numOfDays; i=i+1)
		{
			if(arguments.startdate lte enddate)
			{
				dateArray[i][1] = dateformat(arguments.startdate,"yyyy/mm/dd");
				switch(dayofweek(arguments.startdate))
				{
					case 2:
					{
						dateArray[i][2] = "Mon, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					case 3:
					{
						dateArray[i][2] = "Tues, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					case 4:
					{
						dateArray[i][2] = "Wed, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					case 5:
					{
						dateArray[i][2] = "Thur, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					case 6:
					{
						dateArray[i][2] = "Fri, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					default:
					{
						dateArray[i][2] = "Empty";
						break;
					}
				}	
				arguments.startdate = dateadd("d",1,arguments.startdate);				
			}
		}	
		
		//Clean out array of "Empty" cells
		for(i=1; i lt arraylen(dateArray); i=i+1)
		{
			if(dateArray[i][2] eq "Empty")
			{
				ArrayDeleteAt(dateArray,i);//Saturday
				ArrayDeleteAt(dateArray,i);//Sunday
			}		
		}			
	</cfscript>
	<cfreturn dateArray>
</cffunction>