<cffunction name="cacheCreate" output="false" returntype="void" 
	hint="I create a new user defined cache region in Ehcache" 
	description="I create a new user defined cache region in Ehcache. This function
			     allows you to also configure the attributes for the custom cache, 
			     something you would normally have to hard code in the ehcache.xml 
			     file if you rely on ColdFusion's built in caching functions. I named
			     the function cacheCreate() and not cacheNew() in the hopes that a
			     future version of ColdFusion includes a cacheNew() function with
			     similar functionality.">

	<!--- this is what's configurable as of Ehcache 2.0 (CF 9.0.1). Only required
		  argument is Name --->
	<cfargument name="name" type="string" required="true">
	<cfargument name="maxElementsInMemory" type="numeric" default="10000">
	<cfargument name="maxElementsOnDisk" type="numeric" default="10000000">  
	<cfargument name="memoryStoreEvictionPolicy" type="string" default="LRU">
	<cfargument name="clearOnFlush" type="boolean" default="true">
	<cfargument name="eternal" type="boolean" default="false">
	<cfargument name="timeToIdleSeconds" type="numeric" default="86400"> 
	<cfargument name="timeToLiveSeconds" type="numeric" default="86400">
	<cfargument name="overflowToDisk" type="boolean" default="false">
	<cfargument name="diskPersistent" type="boolean" default="false">
	<cfargument name="diskSpoolBufferSizeMB" type="numeric" default="30">
	<cfargument name="diskAccessStripes" type="numeric" default="1">
	<cfargument name="diskExpiryThreadIntervalSeconds" type="numeric" default="120">
	
	<!--- We need to do this in java because ColdFusion's cacheGetSession() returns
	      the underlying object for an EXISTING cache, not the generic cache manager ---> 
	<cfset local.cacheManager = createObject('java', 'net.sf.ehcache.CacheManager').getInstance()>

	<!--- constructor takes cache name and max elements in memory --->
	<cfset local.cacheConfig = createObject("java", "net.sf.ehcache.config.CacheConfiguration").init("#arguments.name#", #arguments.maxElementsInMemory#)>
	<cfset local.cacheConfig.maxElementsOnDisk(#arguments.maxElementsOnDisk#)>
	<cfset local.cacheConfig.memoryStoreEvictionPolicy("#arguments.memoryStoreEvictionPolicy#")>
	<cfset local.cacheConfig.clearOnFlush(#arguments.clearOnFlush#)>
	<cfset local.cacheConfig.eternal(#arguments.eternal#)>
	<cfset local.cacheConfig.timeToIdleSeconds(#arguments.timeToIdleSeconds#)>
	<cfset local.cacheConfig.timeToLiveSeconds(#arguments.timeToLiveSeconds#)>
	<cfset local.cacheConfig.overflowToDisk(#arguments.overflowToDisk#)>
	<cfset local.cacheConfig.diskPersistent(#arguments.diskPersistent#)>
	<cfset local.cacheConfig.diskSpoolBufferSizeMB(#arguments.diskSpoolBufferSizeMB#)>
	<cfset local.cacheConfig.diskAccessStripes(#arguments.diskAccessStripes#)>
	<cfset local.cacheConfig.diskExpiryThreadIntervalSeconds(#arguments.diskExpiryThreadIntervalSeconds#)>

	<cfset local.cache = createObject("java", "net.sf.ehcache.Cache").init(local.cacheConfig)>
	<cfset local.cacheManager.addCache(local.cache)>
</cffunction>