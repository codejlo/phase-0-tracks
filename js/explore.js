// explore.js
// Jason Lorentzen

/* ### PSEUDOCODE ###

** AN APPROACH **
- Accept a string into a function
- For each letter in the given string:
	- Read the NEXT letter in the string and copy it to the FIRST position in a new string
	- Proceed to the next letter in the original string
- Return the new string

** ANOTHER APPROACH **
- Accept a string into a function
- For each letter in the given string:
	- Read the LAST letter in the string and copy it to the NEXT position in a new string
	- Proceed to the prior letter in the original string
- Return the new string

*/

// First approach
function reverse(revStr) {
	var newStr = ""
	for (i=0;i<revStr.length;i++) {
		newStr = revStr[i] + newStr
	}
	return newStr
}

var myString1 = "Hello World!"
var myStringReverse = reverse(myString1)

if (1 == 1) {
	console.log(myStringReverse)
}


// Second approach
function reverse2(revStr) {
	var newStr = ""
	for (i=revStr.length-1;i>=0;i--) {
		newStr += revStr[i]
	}
	return newStr
}

var myString2 = "Hello World!"
var myString2Reverse = reverse2(myString2)
if (0 != 1) {
	console.log(myStringReverse)
}

