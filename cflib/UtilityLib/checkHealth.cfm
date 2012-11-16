<cffunction name="checkHealth" access="public" output="false" returntype="struct" hint="serve system checks for nagios or other monitoring solutions">
  <cfargument name="sCheckType" type="string" default="jvmMem" hint="(jvmMem|reqTime|queu)" />

  <cfscript>
    var sAdminPwd  = 'topsecret'; //password for your CF-Admin-Login
    var adminObj   = {}; //not defined here to avoid unnecessary overhead
    var runtimeObj = {}; //not defined here to avoid unnecessary overhead
    var strHeart   = {}; //not defined here to avoid unnecessary overhead
    var strReturn  = { typ = arguments.sCheckType, value = 0, health = 0 };

    switch(arguments.sCheckType) {
      case 'jvmMem': {
        try {
          runtimeObj      = CreateObject("java","java.lang.Runtime").getRuntime();
          strReturn.value = int((runtimeObj.totalMemory()/runtimeObj.maxMemory())*100);
          if(strReturn.value GT 70) { //percent memory userd, warning level
            strReturn.health = 1;
            if(strReturn.value GT 85) { //percent memory userd, critical level
              strReturn.health = 2;
            }
          }
        }
        catch(any err) {
          strReturn.health = 3;
        }
        break;
      }
      case 'reqTime': {
        try {
          adminObj = createObject("component","cfide.adminapi.administrator").login(sAdminPwd);
          strHeart = createObject("component","cfide.adminapi.servermonitoring").getHeartbeat();
          strReturn.value = strHeart.avgTime;
          if(strHeart.avgTime GT 2000) { //average request time, warning level
            strReturn.health = 1;
            if(strHeart.avgTime GT 8000){ //average request time, critical level
              strReturn.health = 2;
            }
          }
        }
        catch(any err) {
          strReturn.health = 3;
        }
        break;
      }
      case 'queu': {
        try {
          adminObj = createObject("component","cfide.adminapi.administrator").login(sAdminPwd);
          strHeart = createObject("component","cfide.adminapi.servermonitoring").getHeartbeat();
          strReturn.value = strHeart.reqQueued;
          if(strHeart.reqQueued GT 3) { //queued requests, warning level
            strReturn.health = 1;
            if(strHeart.reqQueued GT 6) {//queued requests, critical level
              strReturn.health = 2;
            }
          }
        }
        catch(any err) {
          strReturn.health = 3;
        }
        break;
      }
      default: {
        strReturn.health = 3;
        break;
      }
    }
    return strReturn;
  </cfscript>
</cffunction>