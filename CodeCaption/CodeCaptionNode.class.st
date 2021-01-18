"
I'm a CodeCaptionNode.

I have all references to the source code that the CodeCaptionComment references.

"
Class {
	#name : #CodeCaptionNode,
	#superclass : #Object,
	#instVars : [
		'methodNode',
		'node',
		'nodeClass'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #accessing }
CodeCaptionNode >> methodNode [
	^ methodNode
]

{ #category : #accessing }
CodeCaptionNode >> methodNode: anObject [
	methodNode := anObject
]

{ #category : #accessing }
CodeCaptionNode >> node [
	^ node
]

{ #category : #accessing }
CodeCaptionNode >> node: anObject [
	node := anObject
]

{ #category : #accessing }
CodeCaptionNode >> nodeClass [
	^ nodeClass
]

{ #category : #accessing }
CodeCaptionNode >> nodeClass: anObject [
	nodeClass := anObject
]
