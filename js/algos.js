// algos.js
// Jason Lorentzen

/* PSEUDOCODE for longest word function
- Accept an array of strings
- Loop through the array, and for each entry:
	- determine the length of the entry
	- if it is the longest one so far, save it
	- if it is tied for the longest, don't do anything
	- if it is shorter than the longest so far, don't do anything
- Return the longest string
*/

function longest_word(myAry) {
	var longest = "";
	for (i = 0; i<myAry.length; i++) {
		if (myAry[i].length > longest.length) {
			longest = myAry[i];
		}
	}
	return longest;
}

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

console.log(longest_word(cantStop1));
console.log(longest_word(cantStop2));
console.log(longest_word(cantStop3));
