"
Comentario asociado a porción de código
"
Class {
	#name : #CodeCaptionComment,
	#superclass : #Object,
	#instVars : [
		'node',
		'comment',
		'resolved',
		'author'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #'instance creation' }
CodeCaptionComment class >> newWithNode:aProgramNode [
	^ self new
		node: aProgramNode ;
		yourself.
]

{ #category : #'instance creation' }
CodeCaptionComment class >> newWithText:aCommentText [
	^ self new
		comment: aCommentText;
		yourself.
]

{ #category : #'instance creation' }
CodeCaptionComment class >> text:aCommentText author:anAuthor node: aProgramNode [
	^ self new
		comment: aCommentText;
		author: anAuthor;
		node: aProgramNode;  
		yourself.
]

{ #category : #accessing }
CodeCaptionComment >> author [
	^ author
]

{ #category : #accessing }
CodeCaptionComment >> author: anObject [
	author := anObject
]

{ #category : #accessing }
CodeCaptionComment >> comment [
	^ comment
]

{ #category : #accessing }
CodeCaptionComment >> comment: anObject [
	comment := anObject
]

{ #category : #accessing }
CodeCaptionComment >> node [
	^ node
]

{ #category : #accessing }
CodeCaptionComment >> node: anObject [
	node := anObject
]

{ #category : #actions }
CodeCaptionComment >> resolve [
	self resolved: true.
]

{ #category : #accessing }
CodeCaptionComment >> resolved [
	^ resolved
]

{ #category : #accessing }
CodeCaptionComment >> resolved: anObject [
	resolved := anObject
]
