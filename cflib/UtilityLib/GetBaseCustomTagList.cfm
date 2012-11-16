function getBaseCustomTagList() {
   var x = 1;
   var customTags = "";
   var baseTags = listToArray( getBaseTagList() );
   
   for( x = 1; x LTE arrayLen( baseTags ); x = x + 1 )
   {
      if( left( baseTags[ x ], 3 ) IS "CF_" )
      {
         customTags = listAppend( customTags, baseTags[ x ] );
      }
   }
   
   return customTags;
}