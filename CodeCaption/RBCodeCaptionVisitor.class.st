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
	aLiteralArrayNode dump == node dump
		ifTrue: [ astNode := aLiteralArrayNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitLiteralNode: aLiteralNode [
	aLiteralNode dump == node dump
		ifTrue: [ astNode := aLiteralNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitLiteralValueNode: aLiteralValueNode [
	aLiteralValueNode dump == node dump
		ifTrue: [ astNode := aLiteralValueNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitMessageNode: aMessageNode [
	aMessageNode dump == node dump
		ifTrue: [ astNode := aMessageNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitMethodNode: aMethodNode [
	aMethodNode dump == node dump
		ifTrue: [ astNode := aMethodNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitParseErrorNode: aParseErrorNode [
	aParseErrorNode dump == node dump
		ifTrue: [ astNode := aParseErrorNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitPragmaNode: aPragmaNode [
	aPragmaNode dump == node dump
		ifTrue: [ astNode := aPragmaNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitReturnNode: aReturnNode [
	aReturnNode dump == node dump
		ifTrue: [ astNode := aReturnNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitSequenceNode: aSequenceNode [
	aSequenceNode dump == node dump
		ifTrue: [ astNode := aSequenceNode ]
]

{ #category : #visiting }
RBCodeCaptionVisitor >> visitVariableNode: aVariableNode [
	aVariableNode dump == node dump
		ifTrue: [ astNode := aVariableNode ]
]
