function maketree( query, unique, parent ){
	var current = 0;
	var path = 0;
	var i = 0;
	var j = 0;
	var items = "";
	var parents = "";
	var position = "";
	var column = "";
	var retQuery = querynew( query.columnlist & ',sortlevel' );
	for (i=1;i lte query.recordcount;i=i+1)
		items = listappend( items, query[unique][i] );
	for (i=1;i lte query.recordcount;i=i+1)
		parents = listappend( parents, query[parent][i] );
	
	for (i=1;i lte query.recordcount;i=i+1){
		queryaddrow( retQuery );
		position = listfind( parents, current );
		while (not position){
			path= listrest( path );
			current = listfirst( path );
			position = listfind( parents, current );
		}
		for (j=1;j lte listlen( query.columnlist ); j=j+1){
			column = listgetat( query.columnlist, j );
			querysetcell( retQuery, column, evaluate( 'query.'&column&'[position]') );
		}
		querysetcell( retQuery, 'sortlevel', listlen( path ) );
		current = listgetat( items, position );
		parents = listsetat( parents, position, '-' );
		path = listprepend( path, current);
	}
	return retQuery;
}