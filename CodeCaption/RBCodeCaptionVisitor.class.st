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
	anArrayNode dump == node dump ifTrue: [ astNode := anArrayNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitAssignmentNode: anAssignmentNode [
	anAssignmentNode dump == node dump ifTrue: [ astNode := anAssignmentNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitBlockNode: aBlockNode [
	aBlockNode dump == node dump ifTrue: [ astNode := aBlockNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitCascadeNode: aCascadeNode [
	aCascadeNode dump == node dump
		ifTrue: [ astNode := aCascadeNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitLiteralArrayNode: aLiteralArrayNode [
	stream
		nextPutAll: aLiteralArrayNode class name;
		nextPutAll: ' value: #('.
	(aLiteralArrayNode contents collect: [ :each | each value ]) printOn: stream delimiter: ' '.
	stream nextPutAll: ')'
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitLiteralNode: aLiteralNode [
	self visitLiteralValueNode: aLiteralNode
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitLiteralValueNode: aLiteralValueNode [
	stream
		nextPutAll: aLiteralValueNode class name;
		nextPutAll: ' value: '.
	aLiteralValueNode value printOn: stream
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitMessageNode: aMessageNode [
	stream
		nextPutAll: aMessageNode class name;
		nextPutAll: ' receiver: ('.
	aMessageNode receiver acceptVisitor: self.
	stream nextPutAll: ') selector: '.
	aMessageNode selector printOn: stream.
	aMessageNode arguments
		ifNotEmpty: [ stream nextPutAll: ' arguments: {'.
			aMessageNode arguments
				do: [ :each | 
					each acceptVisitor: self.
					stream nextPutAll: '. ' ].
			stream nextPut: $} ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitMethodNode: aMethodNode [
	| hasPragmas |
	hasPragmas := aMethodNode pragmas isNotEmpty.
	hasPragmas
		ifTrue: [ stream nextPut: $( ].
	stream
		nextPutAll: aMethodNode class name;
		nextPutAll: ' selector: '.
	aMethodNode selector printOn: stream.
	aMethodNode arguments
		ifNotEmpty: [ stream nextPutAll: ' arguments: {'.
			aMethodNode arguments
				do: [ :each | 
					each acceptVisitor:self.
					stream nextPutAll: '. ' ].
			stream nextPut: $} ].
	aMethodNode body
		ifNotNil: [ stream nextPutAll: ' body: ('.
			aMethodNode body acceptVisitor:self.
			stream nextPut: $) ].
	hasPragmas
		ifFalse: [ ^ aMethodNode ].
	stream nextPutAll: ') pragmas: {'.
	aMethodNode pragmas
		do: [ :each | 
			each acceptVisitor: self.
			stream nextPutAll: '. ' ].
	stream nextPut: $}
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitParseErrorNode: aParseErrorNode [
	stream
		nextPutAll: aParseErrorNode class name;
		nextPutAll: ' errorMessage: '.
	aParseErrorNode errorMessage printOn: stream.
	stream nextPutAll: ' value: '.
	aParseErrorNode value printOn: stream.
	stream nextPutAll: ' at: '.
	aParseErrorNode start printOn: stream
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitPragmaNode: aPragmaNode [
	stream
		nextPutAll: aPragmaNode class name;
		nextPutAll: ' selector: '.
	aPragmaNode selector printOn: stream.
	stream nextPutAll: ' arguments: {'.
	aPragmaNode arguments
		do: [ :each | 
			each acceptVisitor: self.
			stream nextPutAll: '. ' ].
	stream nextPut: $}
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitReturnNode: aReturnNode [
	stream
		nextPutAll: aReturnNode class name;
		nextPutAll: ' value: ('.
	aReturnNode value acceptVisitor:self.
	stream nextPut: $)
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitSequenceNode: aSequenceNode [
	stream nextPutAll: aSequenceNode class name.
	aSequenceNode temporaries
		ifNotEmpty: [ stream nextPutAll: ' temporaries: {'.
			aSequenceNode temporaries
				do: [ :each | 
					each acceptVisitor: self.
					stream nextPutAll: '. ' ].
			stream nextPut: $} ].
	stream nextPutAll: ' statements: {'.
	aSequenceNode statements
		do: [ :each | 
			each acceptVisitor: self.
			stream nextPutAll: '. ' ].
	stream nextPut: $}
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitVariableNode: aVariableNode [
	stream
		nextPutAll: aVariableNode class name;
		nextPutAll: ' named: '.
	aVariableNode name printOn: stream
]
