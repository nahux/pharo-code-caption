"
I'm an AST visitor for CodeCaption.
I'm used to search for nodes with CodeCaptions in the source code AST.
"
Class {
	#name : #CodeCaptionRBNodeMatcher,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'node',
		'astNode'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #'instance creation' }
CodeCaptionRBNodeMatcher class >> newWithNode: anRBProgramNode [
	^ self new
		node: anRBProgramNode ;
		yourself.
]

{ #category : #accessing }
CodeCaptionRBNodeMatcher >> astNode [
	^ astNode
]

{ #category : #accessing }
CodeCaptionRBNodeMatcher >> astNode: anRBProgramNode [
	astNode := anRBProgramNode
]

{ #category : #helper }
CodeCaptionRBNodeMatcher >> compareNodeTo: anotherRBProgramNode [
	^ self node newSource = anotherRBProgramNode newSource
]

{ #category : #accessing }
CodeCaptionRBNodeMatcher >> node [
	^ node
]

{ #category : #accessing }
CodeCaptionRBNodeMatcher >> node: aParsedProgramNode [
	node := aParsedProgramNode
]

{ #category : #accessing }
CodeCaptionRBNodeMatcher >> visitNode: anASTNode [
	self node newSource = anASTNode newSource
		ifTrue: [ astNode := anASTNode  ]
		ifFalse: [ super visitNode: anASTNode  ] 
]
