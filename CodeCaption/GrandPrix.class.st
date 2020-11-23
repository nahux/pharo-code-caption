"
I'm a race circuit
"
Class {
	#name : #GrandPrix,
	#superclass : #Object,
	#instVars : [
		'name',
		'country',
		'teams',
		'raceResults'
	],
	#category : #'CodeCaption-Test'
}

{ #category : #accessing }
GrandPrix >> addTeam: aTeam [
	teams add: aTeam
]

{ #category : #accessing }
GrandPrix >> country [
	^ country
]

{ #category : #accessing }
GrandPrix >> country: anObject [
	country := anObject
]

{ #category : #accessing }
GrandPrix >> initialize [
	teams:= OrderedCollection new.
	raceResults:= OrderedCollection new.
]

{ #category : #accessing }
GrandPrix >> name [
	^ name
]

{ #category : #accessing }
GrandPrix >> name: anObject [
	name := anObject
]

{ #category : #accessing }
GrandPrix >> race [
	| drivers resultArray |
	resultArray:= OrderedCollection new.
	drivers:= teams flatCollect: [ :t | t drivers ].
	raceResults:=  drivers shuffled.
]

{ #category : #accessing }
GrandPrix >> raceResults [
	^ raceResults
]

{ #category : #accessing }
GrandPrix >> raceResults: anObject [
	raceResults := anObject
]

{ #category : #accessing }
GrandPrix >> teams [
	^ teams
]

{ #category : #accessing }
GrandPrix >> teams: anObject [
	teams := anObject
]
