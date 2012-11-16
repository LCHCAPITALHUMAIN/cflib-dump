function ReMatch(RegEx,Txt)
{
	var MatchList=ArrayNew(1);
	var tmp="";
	var Done=0;
	var StartPos=1;
	Arguments.Txt=Arguments.Txt & " ";

	while (NOT Done) {
		tmp=ReFind(Arguments.RegEx,Arguments.Txt,StartPos,"true");
		if (tmp.Pos[1] EQ "0") {
			Done=1;
		} else {
			MatchList[ArrayLen(MatchList) + 1]=Mid(Arguments.Txt,tmp.Pos[1],tmp.Len[1]);
			StartPos=tmp.Pos[1] + Tmp.Len[1];
		}
	}
	return MatchList;
}