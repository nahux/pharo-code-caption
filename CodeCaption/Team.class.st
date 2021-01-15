"
I'm a racing team
"
Class {
	#name : #Team,
	#superclass : #Object,
	#instVars : [
		'name',
		'drivers',
		'points'
	],
	#category : #'CodeCaption-Test'
}

{ #category : #accessing }
Team >> addDriver: aDriver [
	drivers add: aDriver
]

{ #category : #accessing }
Team >> drivers [
	^ drivers
]

{ #category : #accessing }
Team >> drivers: anObject [
	drivers := anObject
]

{ #category : #accessing }
Team >> initialize [
	drivers := OrderedCollection new
]

{ #category : #accessing }
Team >> name [
	^ name
]

{ #category : #accessing }
Team >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Team >> points [
	^ points
]

{ #category : #accessing }
Team >> points: anObject [
	points := anObject
]
