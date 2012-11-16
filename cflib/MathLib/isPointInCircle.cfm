function isPointInCircle (pointX, pointY, circleX, circleY, circleRadius) {
	var dx = (circleX - pointX);
	var dy = (circleY - pointY);
	return (dx * dx + dy * dy) LTE circleRadius * circleRadius;
}