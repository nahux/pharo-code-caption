"
I'm an AST visitor for CodeCaption.
I'm used to search for nodes with CodeCaptions in the source code AST.
"
Class {
	#name : #RBCodeCaptionVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'node',
		'astNode'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #'instance creation' }
RBCodeCaptionVisitor class >> newWithNode: anRBProgramNode [
	^ self new
		node: anRBProgramNode ;
		yourself.
]

{ #category : #accessing }
RBCodeCaptionVisitor >> astNode [
	^ astNode
]

{ #category : #accessing }
RBCodeCaptionVisitor >> astNode: anRBProgramNode [
	astNode := anRBProgramNode
]

{ #category : #helper }
RBCodeCaptionVisitor >> compareNodeTo: anotherRBProgramNode [
	^ self node newSource = (anotherRBProgramNode source copyFrom: anotherRBProgramNode start to: anotherRBProgramNode stop)
]

{ #category : #accessing }
RBCodeCaptionVisitor >> node [
	^ node
]

{ #category : #accessing }
RBCodeCaptionVisitor >> node: aParsedProgramNode [
	node := aParsedProgramNode
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitArrayNode: anArrayNode [
	(self compareNodeTo: anArrayNode)
		ifTrue: [ astNode := anArrayNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitAssignmentNode: anAssignmentNode [
	(self compareNodeTo: anAssignmentNode)
		ifTrue: [ astNode := anAssignmentNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitBlockNode: aBlockNode [
	(self compareNodeTo: aBlockNode)
		ifTrue: [ astNode := aBlockNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitCascadeNode: aCascadeNode [
	(self compareNodeTo: aCascadeNode)
		ifTrue: [ astNode := aCascadeNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitLiteralArrayNode: aLiteralArrayNode [
	(self compareNodeTo: aLiteralArrayNode)
		ifTrue: [ astNode := aLiteralArrayNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitLiteralNode: aLiteralNode [
	(self compareNodeTo: aLiteralNode)
		ifTrue: [ astNode := aLiteralNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitLiteralValueNode: aLiteralValueNode [
	(self compareNodeTo: aLiteralValueNode)
		ifTrue: [ astNode := aLiteralValueNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitMessageNode: aMessageNode [
	(self compareNodeTo: aMessageNode)
		ifTrue: [ astNode := aMessageNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitMethodNode: aMethodNode [
	(self compareNodeTo: aMethodNode)
		ifTrue: [ astNode := aMethodNode ]
		ifFalse: [ 
			aMethodNode arguments ifNotEmpty: [ aMethodNode arguments do: [ :each | each acceptVisitor: self ] ].
			aMethodNode body ifNotNil: [ aMethodNode body acceptVisitor: self ].
		].
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitParseErrorNode: aParseErrorNode [
	(self compareNodeTo: aParseErrorNode)
		ifTrue: [ astNode := aParseErrorNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitReturnNode: aReturnNode [
	(self compareNodeTo: aReturnNode)
		ifTrue: [ astNode := aReturnNode ]
		ifFalse: [ (aReturnNode value) ifNotNil: [ aReturnNode value acceptVisitor: self ] ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitSequenceNode: aSequenceNode [
	(self compareNodeTo: aSequenceNode)
		ifTrue: [ astNode := aSequenceNode ]
		ifFalse: [ 
			aSequenceNode temporaries ifNotEmpty:
				[ aSequenceNode temporaries do: [ :each | each acceptVisitor: self ] ].
			aSequenceNode statements do: [ :each | each acceptVisitor: self ] 
		]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitVariableNode: aVariableNode [
	(self compareNodeTo: aVariableNode)
		ifTrue: [ astNode := aVariableNode ]
]
