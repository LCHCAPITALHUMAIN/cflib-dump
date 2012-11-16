function FirstInFirstOut( array, valueToAdd ) {

	// Delete element at index 1
	ArrayDeleteAt( array, 1 );
	
	// Add new element at last index plus one
	array[ArrayLen( array ) + 1] = valueToAdd;
	
	return array;
	
}