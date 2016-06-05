# nested_data_structures.rb
# Jason Lorentzen
#
# Nested data structure representing the houses of Game of Thrones
#


game_of_thrones = {
	stark: {
		formal_name: 'House Stark',
		members: {
			head: 'Eddard',
			wife: 'Catelyn',
			heir: 'Robb',
			children: [
				{name: 'Sansa', place: 3},
				{name: 'Arya', place: 2},
				{name: 'Bran', place: 0},
				{name: 'Rickon', place: 1}
			],
			bastards: [
				'Jon'
			]
		},
		sigil: 'direwolf',
		lands: 'the North',
		motto: 'Winter is Coming',
		strengths: [
			'honor',
			'badass direwolves'
		],
		weaknesses: [
			'hope',
			'trust'
		]
	},
	lannister: {
		formal_name: 'House Lannister',
		members: {
			head: 'Tywin',
			wife: 'Joanna',
			heir: 'Joffrey',
			children: [
				{name: 'Cersei', place: 2},
				{name: 'Jaime', place: 0},
				{name: 'Tyrion', place: 1}
			],
			bastards: [
				
			]
		},
		sigil: 'lion',
		lands: 'the Westerlands',
		motto: 'A Lannister always pays his debts',
		strengths: [
			'cunning',
			'power'
		],
		weaknesses: [
			'arrogance',
			'incest'
		]
	}
}

p game_of_thrones[:stark][:members][:children][0][:name]
p game_of_thrones[:lannister][:weaknesses][1]
p game_of_thrones[:stark][:sigil]