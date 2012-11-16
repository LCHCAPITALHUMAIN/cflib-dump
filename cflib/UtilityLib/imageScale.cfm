function imageScale(selector,oldHeight,oldWidth,newParameter) {
		var ratioA = oldHeight/oldWidth;
		var ratioB = oldWidth/oldHeight;
		if (selector is 'h') {
			return round(newParameter * (1/ratioA));
		} else if (selector is 'w') {
			return round(newParameter * (1/ratioB));
		}
	}