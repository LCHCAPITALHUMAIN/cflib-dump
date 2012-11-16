function listdelete(variable){
        //var to hold the final string
        var string = "";
        //vars for use in the loop, so we don't have to evaluate lists and arrays more than once
        var ii = 1;
        var thisVar = "";
        var thisIndex = "";
        var array = "";
        var qs = "";
        if(arrayLen(arguments) GT 1)
                qs = arguments[2];
        //put the query string into an array for easier looping
        array = listToArray(qs,",");            
        //now, loop over the array and rebuild the string
        for(ii = 1; ii lte arrayLen(array); ii = ii + 1){
                thisIndex = array[ii];
                thisVar = thisIndex;
                //if this is the var, edit it to the value, otherwise, just append
                if(not listFindnocase(variable,thisVar))
                        string = listAppend(string,thisIndex,",");
        }
        //return the string
        return string;
}