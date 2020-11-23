"
I'm a racing driver
"
Class {
	#name : #Driver,
	#superclass : #Object,
	#instVars : [
		'name',
		'age',
		'points'
	],
	#category : #'CodeCaption-Test'
}

{ #category : #accessing }
Driver >> age [
	^ age
]

{ #category : #accessing }
Driver >> age: anObject [
	age := anObject
]

{ #category : #accessing }
Driver >> name [
	^ name
]

{ #category : #accessing }
Driver >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Driver >> points [
	^ points
]

{ #category : #accessing }
Driver >> points: anObject [
	points := anObject
]
