// algos.js
// Jason Lorentzen

///--- BUSINESS LOGIC ---///

/*** PSEUDOCODE for longestWord function ***
- Accept an array of strings
- Loop through the array, and for each entry:
	- determine the length of the entry
	- if it is the longest one so far, save it
	- if it is tied for the longest, don't do anything
	- if it is shorter than the longest so far, don't do anything
- Return the longest string
*/

function longestWord(myAry) {
	var longest = "";
	for (i = 0; i<myAry.length; i++) {
		if (myAry[i].length > longest.length) {
			longest = myAry[i];
		}
	}
	return longest;
}


/*** PSEUDOCODE for object_match function ***
- Accept two objects (hashes)
- For each key in object 1:
	- access the value of the key in object 1
	- access the value of the same key in object 2
	- test for equivalence
	- if equivalent, exit the function with a return value of true
	- otherwise, continue to the next key
- if loop goes through all keys in object one without finding a match:
	 - return false
*/

function objectMatch(object1, object2) {
	for (key in object1) {
		if (object1[key] == object2[key]) {
			return true;
		}
	}
	return false;
}



///--- DRIVER CODE ---///

cantStop1 = ["I got this feeling",
			 "inside my bones",
			 "It goes electric",
			 "wavey when I turn it on",
			 "All through my city",
			 "all through my home",
			 "We're flying up",
			 "no ceiling",
			 "when we in our zone"];

cantStop2 = ["I got that sunshine in my pocket",
			 "Got that good soul in my feet"];

cantStop3 = ["I feel that hot blood in my body when it drops, ooh", 
		     "I can't take my eyes up off it, moving so phenomenally", 
		     "Room on lock the way we rock it, so don't stop"];

console.log(longestWord(cantStop1));
console.log(longestWord(cantStop2));
console.log(longestWord(cantStop3));


myObject1 = {name: "Alice",
			 age: 44,
			 gender: "female",
			 occupation: "ninja"};

myObject2 = {name: "Javier",
			 age: 32,
			 gender: "male",
			 occupation: "developer"};

myObject3 = {name: "Li",
			 age: 50,
			 gender: "female",
			 occupation: "developer"};

console.log(objectMatch(myObject1, myObject2));
console.log(objectMatch(myObject1, myObject3));

