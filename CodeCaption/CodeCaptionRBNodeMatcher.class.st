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
	^ self node newSource = (anotherRBProgramNode source copyFrom: anotherRBProgramNode start to: anotherRBProgramNode stop)
]

{ #category : #accessing }
CodeCaptionRBNodeMatcher >> node [
	^ node
]

{ #category : #accessing }
CodeCaptionRBNodeMatcher >> node: aParsedProgramNode [
	node := aParsedProgramNode
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitArrayNode: anArrayNode [
	(self compareNodeTo: anArrayNode)
		ifTrue: [ astNode := anArrayNode ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitAssignmentNode: anAssignmentNode [
	(self compareNodeTo: anAssignmentNode)
		ifTrue: [ astNode := anAssignmentNode ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitBlockNode: aBlockNode [
	(self compareNodeTo: aBlockNode)
		ifTrue: [ astNode := aBlockNode ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitCascadeNode: aCascadeNode [
	(self compareNodeTo: aCascadeNode)
		ifTrue: [ astNode := aCascadeNode ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitLiteralArrayNode: aLiteralArrayNode [
	(self compareNodeTo: aLiteralArrayNode)
		ifTrue: [ astNode := aLiteralArrayNode ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitLiteralNode: aLiteralNode [
	(self compareNodeTo: aLiteralNode)
		ifTrue: [ astNode := aLiteralNode ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitLiteralValueNode: aLiteralValueNode [
	(self compareNodeTo: aLiteralValueNode)
		ifTrue: [ astNode := aLiteralValueNode ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitMessageNode: aMessageNode [
	(self compareNodeTo: aMessageNode)
		ifTrue: [ astNode := aMessageNode ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitMethodNode: aMethodNode [
	(self compareNodeTo: aMethodNode)
		ifTrue: [ astNode := aMethodNode ]
		ifFalse: [ 
			aMethodNode arguments ifNotEmpty: [ aMethodNode arguments do: [ :each | each acceptVisitor: self ] ].
			aMethodNode body ifNotNil: [ aMethodNode body acceptVisitor: self ].
		].
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitParseErrorNode: aParseErrorNode [
	(self compareNodeTo: aParseErrorNode)
		ifTrue: [ astNode := aParseErrorNode ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitReturnNode: aReturnNode [
	(self compareNodeTo: aReturnNode)
		ifTrue: [ astNode := aReturnNode ]
		ifFalse: [ (aReturnNode value) ifNotNil: [ aReturnNode value acceptVisitor: self ] ]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitSequenceNode: aSequenceNode [
	(self compareNodeTo: aSequenceNode)
		ifTrue: [ astNode := aSequenceNode ]
		ifFalse: [ 
			aSequenceNode temporaries ifNotEmpty:
				[ aSequenceNode temporaries do: [ :each | each acceptVisitor: self ] ].
			aSequenceNode statements do: [ :each | each acceptVisitor: self ] 
		]
]

{ #category : #visiting }
CodeCaptionRBNodeMatcher >> visitVariableNode: aVariableNode [
	(self compareNodeTo: aVariableNode)
		ifTrue: [ astNode := aVariableNode ]
]
