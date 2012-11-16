function stripURLToken (x) {
return REReplace(x, "(\?|&)([Cc][Ff][Ii][Dd]|[Cc][Ff][Tt][Oo][Kk][Ee][Nn]|[Jj][Ss][Ee][Ss][Ss][Ii][Oo][Nn][Ii][Dd])=[\s\S]+", "", "ALL");
}