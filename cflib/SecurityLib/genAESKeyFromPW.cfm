string function genAESKeyFromPW(required string password, required string salt64, numeric length=128){
	// Decode the salt value that was provided.
	var salt = toString(toBinary(arguments.salt64));
	
	// Go fetch Java's secret key factory so we can generate a key.
	var keyFactory = createObject("java", "javax.crypto.SecretKeyFactory").getInstance("PBKDF2WithHmacSHA1");
	
	// Define a key specification based on the password and salt that were provided.
	var keySpec = createObject("java", "javax.crypto.spec.PBEKeySpec").init(
		arguments.password.toCharArray(),	// Convert the password to a character array (char[])
		salt.getBytes(),					// Convert the salt to a byte array (byte[])
		javaCast("int", 1024),				// Iterations as Java int
		javaCast("int", arguments.length)	// Key length as Java int (192 or 256 may be available depending on your JVM)
	);
	
	// Initialize the secret key based on the password/salt specification.
	var tempSecret = keyFactory.generateSecret(keySpec);

	// Generate the AES key based on our secret key.
	var secretKey = createObject("java", "javax.crypto.spec.SecretKeySpec").init(tempSecret.getEncoded(), "AES");

	// Return the generated key as a Base64-encoded string.
	return toBase64(secretKey.getEncoded());	
}