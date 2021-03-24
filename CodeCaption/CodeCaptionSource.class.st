"
I'm a Code Caption reviewed Source Code.

I identify the AST node that the CodeCaption review is for.
I have the actual AST node that is referenced.
I have the method node containing the AST node referenced.
I have the Class reference that contains the method node.

Every time a new CodeCaptionComment is created, it is created referencing an instance of myself.
"
Class {
	#name : #CodeCaptionSource,
	#superclass : #Object,
	#instVars : [
		'methodNode',
		'node',
		'nodeClass'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #accessing }
CodeCaptionSource >> methodNode [
	^ methodNode
]

{ #category : #accessing }
CodeCaptionSource >> methodNode: anObject [
	methodNode := anObject
]

{ #category : #accessing }
CodeCaptionSource >> node [
	^ node
]

{ #category : #accessing }
CodeCaptionSource >> node: anObject [
	node := anObject
]

{ #category : #accessing }
CodeCaptionSource >> nodeClass [
	^ nodeClass
]

{ #category : #accessing }
CodeCaptionSource >> nodeClass: anObject [
	nodeClass := anObject
]
