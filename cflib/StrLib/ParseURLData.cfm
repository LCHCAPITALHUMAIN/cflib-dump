function parseURLData() {
        
        var strListType = "";
        var strParamDelimiter = "";
        var strPathInfo = "";
        var thisLen  = 0;
        var URLLen = 0;
        var URLData = "";
        var evenNumberOfParams = true;
        var containsDelim = 0;
        var paramList = "";
        var paramStruct = structNew();
        var offset = 0;

        // get the listType if one was provided
        if (arrayLen(arguments) eq 1) {
        
            strListType = arguments[1];

        } else If(arrayLen(arguments) eq 2) {
        
            strListType = arguments[1];
            strParamDelimiter = arguments[2];
            
        }
        
        // see if we can user the listType arg
        if (trim(strListType) neq "" AND NOT isNumeric(strListType) ) {
            strListType = strListType;
        } else {
            strListType = "linear";
        }
        
        // see if we can user the listType arg
        if (trim(strParamDelimiter) neq "" AND NOT isNumeric(strParamDelimiter) ) {
            if (len(strParamDelimiter) eq 1) {
                strParamDelimiter = strParamDelimiter;
            } else {
                strParamDelimiter = "/";
            }
        } else {
            strParamDelimiter = "/";
        }
        
        // default back to "linear" if the list type isn't staggered or linear
        if (strListType neq "linear" AND strListType neq "staggered") {
            strListType = "linear";
        }

        // get the path info from either path_info or request_uri
        if (isDefined("CGI.path_info")) {
            strPathInfo = CGI.path_info;
        } else {
            strPathInfo = CGI.request_uri;
        }

        thisLen = len(CGI.script_name);
        URLLen =  len(strPathInfo);
        
        if (URLLen eq 0) return paramStruct;

        //URLData = right(strPathInfo, URLLen - thisLen - 1);
		urlData = strPathInfo;
        // make sure there is the required data
        containsDelim = Find(strParamDelimiter, URLData);
        
        if (containsDelim) {
        
            // it does so make a list and read them in
            paramList = listChangeDelims(URLData, ",", strParamDelimiter);
            paramLimit = listLen(paramList);
            
            // trim the list if its got an odd number of items
            if ( NOT (int(paramLimit/2) eq (paramLimit/2))) {
                evenNumberOfParams = false;
            }

            if (strListType eq "linear") {
                
                // check to make sure that there are an even number of params
                if (NOT evenNumberOfParams) {
                    // cut the last entry off as this list has an odd number of elements
                    paramList = listDeleteAt(paramList, paramLimit);
                    paramLimit = paramLimit - 1;
                }
                
                // param and param data are in pairs
                for ( i = 1; i lte paramLimit; i = i + 2) {
                    structInsert (paramStruct, listGetAt(paramList, i), listGetAt(paramList, i+1));
                }
                
            } else {
                
                // staggered which means the params are listed then the param data
                offset = paramLimit / 2;

                // check to make sure that there are an even number of params
                if (NOT evenNumberOfParams) {
                   offset = fix(paramLimit / 2);
                   paramList = listDeleteAt(paramList, offset + 1);
                }

                 for ( i = 1; i lte offset; i = i + 1) {
                    structInsert (paramStruct, listGetAt(paramList, i), listGetAt(paramList, i + offset));
                }
                
            }
            
            // return a copy of the struct and clear the local version
            return structCopy(paramStruct);
            
        } 
    }