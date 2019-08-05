"
Comentario asociado a porción de código
"
Class {
	#name : #CodeComment,
	#superclass : #Object,
	#instVars : [
		'node',
		'comment'
	],
	#category : #CodeReview
}

{ #category : #'instance creation' }
CodeComment class >> newWithText:aCommentText [
	^ self new
		comment: aCommentText;
		yourself.
]

{ #category : #accessing }
CodeComment >> comment [
	^ comment
]

{ #category : #accessing }
CodeComment >> comment: anObject [
	comment := anObject
]

{ #category : #accessing }
CodeComment >> node [
	^ node
]

{ #category : #accessing }
CodeComment >> node: anObject [
	node := anObject
]
