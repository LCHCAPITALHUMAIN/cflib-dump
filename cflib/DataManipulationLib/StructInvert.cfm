function StructInvert(st) {
		var stn=StructNew();
		var lKeys="";
		var nkey="";
		var i=1;
		var eflg=0;
		if (NOT IsStruct(st)) {
			eflg=1;
		}
		else {
			lKeys=StructKeyList(st);
			for (i=1; i LTE ListLen(lKeys); i=i+1) {
				nKey=listgetat(lkeys, i);
				if (IsSimpleValue(st[nKey]))
					stn[st[nKey]]=nKey;
				else {
					eflg=1;
					break;
				}
			}
		}
		if (eflg is 1) {
			writeoutput("Error in <Code>InvertStruct()</code>! Correct usage: InvertStruct(<I>Structure</I>) -- Returns a structure with the values and keys of <I>Structure</I> inverted when <i>Structure</i> is a structure of simple values.");
			return 0;
		}
		else {
			return stn;
		}
	}