function IsZipNL(str) {
    /* All dutch zip codes contains four numbers and two letters  (NNNN AA) with an optional space for the regex. */
    /* Zips start at 1000 so if the first number is a 0 the zip is wrong. */
    return REFind("^[1-9][[:digit:]]{3}( )?[[:alpha:]]{2}$", arguments.str);
}