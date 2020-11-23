Class {
	#name : #GrandPrixTest,
	#superclass : #TestCase,
	#instVars : [
		'g'
	],
	#category : #'CodeCaption-Test'
}

{ #category : #running }
GrandPrixTest >> setUp [
	| d t |
	super setUp.
	g := GrandPrix new.
	g name: 'Monza'.
	t := Team new.
	t name: 'Ferrari'.
	d := Driver new.
	d name: 'Sebastian Vettel'; age: 32.
	t addDriver: d.
	d := Driver new.
	d name: 'Charles Leclerc'; age: 22.
	t addDriver: d.
	g addTeam: t.
	t := Team new.
	t name: 'Mercedes'.
	d := Driver new.
	d name: 'Lewis Hamilton'; age: 33.
	t addDriver: d.
	d := Driver new.
	d name: 'Valtteri Bottas'; age: 28.
	t addDriver: d.
	g addTeam: t.
	t := Team new.
	t name: 'Red Bull'.
	d := Driver new.
	d name: 'Max Verstappen'; age: 22.
	t addDriver: d.
	d := Driver new.
	d name: 'Alex Albon'; age: 21.
	t addDriver: d.
	g addTeam: t
]

{ #category : #running }
GrandPrixTest >> testRaceResults [
	g race.
	self assert: g raceResults size equals: (g teams flatCollect: [ :team | team drivers ]) size.
	
]
