function randString(type,ct){
 var i=1;
 var randStr="";
 var randNum="";
 var useList="";
 var alpha="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
 var secure="!,@,$,%,&,*,-,_,=,+,?,~";
 for(i=1;i LTE ct;i=i+1){  
  if(type is "alpha"){
   randNum=RandRange(1,52);
   useList=alpha;
  }else if(type is "alphanum"){
   randNum=RandRange(1,62);
   useList="#alpha#,0,1,2,3,4,5,6,7,8,9";
  }else if(type is "secure"){
   randNum=RandRange(1,73);
   useList="#alpha#,0,1,2,3,4,5,6,7,8,9,#secure#";
  }else{
   randNum=RandRange(1,10);
   useList="0,1,2,3,4,5,6,7,8,9";
  }
  
  randStr="#randStr##ListGetAt(useList,randNum)#";
 }
 return randStr;
}