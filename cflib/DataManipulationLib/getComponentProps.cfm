function getComponentProps(object) {
       var propArray = arrayNew(1);
       if (structKeyExists(object,'properties')) {
               propArray = object.properties;
       }
       if (structKeyExists(object,'extends')) {
               propArray.addAll(getComponentProps(object.extends ));
       }
       return propArray;
}