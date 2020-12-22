"
I'm a Code Caption Comment.
I have the reference to a Node in the source code and a comment related to it.
"
Class {
	#name : #CodeCaptionComment,
	#superclass : #Object,
	#instVars : [
		'id',
		'repository',
		'package',
		'methodNode',
		'node',
		'comment',
		'resolved',
		'author'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #'instance creation' }
CodeCaptionComment class >> newWithNode:aProgramNode package: anASTPackage methodNode:aMethodNode repository: anIceLibgitRepository [
	^ self new
		package: anASTPackage;
		node: aProgramNode ;
		methodNode: aMethodNode;
		repository: anIceLibgitRepository ;
		yourself.
]

{ #category : #initialization }
CodeCaptionComment >> = anotherCodeCaptionComment [
	^ self id = anotherCodeCaptionComment id
	
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

{ #category : #initialization }
CodeCaptionComment >> hash [
	^ self id
]

{ #category : #accessing }
CodeCaptionComment >> id [
	^ id
]

{ #category : #accessing }
CodeCaptionComment >> id: anObject [
	id := anObject
]

{ #category : #initialization }
CodeCaptionComment >> initialize [ 
	id:= self identityHash .
]

{ #category : #accessing }
CodeCaptionComment >> methodClass [ 
	^ self methodNode methodClass
]

{ #category : #accessing }
CodeCaptionComment >> methodName [ 
	^ self methodNode selector
]

{ #category : #accessing }
CodeCaptionComment >> methodNode [
	^ methodNode
]

{ #category : #accessing }
CodeCaptionComment >> methodNode: anObject [
	methodNode := anObject
]

{ #category : #accessing }
CodeCaptionComment >> node [
	^ node
]

{ #category : #accessing }
CodeCaptionComment >> node: anObject [
	node := anObject
]

{ #category : #accessing }
CodeCaptionComment >> package [
	^ package
]

{ #category : #accessing }
CodeCaptionComment >> package: anObject [
	package := anObject
]

{ #category : #accessing }
CodeCaptionComment >> repository [
	^ repository
]

{ #category : #accessing }
CodeCaptionComment >> repository: anObject [
	repository := anObject
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

{ #category : #initialization }
CodeCaptionComment >> setUpFromSTON [
	| no |
	no := nil.
	self methodNode
		nodesDo: [ :n | 
			n dump = self node dump
				ifTrue: [ no := n ] ].
	no ifNotNil: [ self node: no ] ifNil: [ self node: self methodNode  ]
]
