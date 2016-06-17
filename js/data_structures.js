// 7.2 Data Structures
// Jason Lorentzen and Juan Rojas


// HORSES ---------------------------------------------

var colors = ["blue", "red", "green", "orange"];

var names = ["Ed", "Seabiscuit", "Su", "Sparky"];

colors.push("pink");
names.push("Bojangles");

function objectCreator(key_ary, value_ary) {
	if (key_ary.length != value_ary.length) {return null};

	var horseObject = {};

	for (i=0; i<key_ary.length; i++)  {
		horseObject[key_ary[i]] = value_ary[i];
	}

	return horseObject;
}

newHorse = objectCreator(names, colors);
console.log(newHorse);



// CARS ---------------------------------------------

function Car(make, model, type, price) {

	this.make = make;
	this.model = model;
	this.type = type;
	this.price = price;

	this.vroom = function() {
		var v = "";

		for (i = 0; i<this.price/1000; i++) {
			v += "O";
		}

		console.log("This "+ this.make + " " + this.model +
			" goes VRO" + v + "M!!")
	}

	console.log("CAR INITIALIZED")
}

var speedy = new Car("Volvo", "900", "Grocery Getter", 30000);
var bigly = new Car("Bentley", "Gold", "Trumper", 1000000);
var huuuuuge = new Car("Ford", "F250", "Pickup", 50000);

console.log(speedy)
speedy.vroom();

console.log(bigly)
bigly.vroom();

console.log(huuuuuge)
huuuuuge.vroom();

