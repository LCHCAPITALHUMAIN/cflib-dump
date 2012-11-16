function getExtension(name) {  
    if(find(".",name)) return listLast(name,".");
    else return "";
}