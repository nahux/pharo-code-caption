"
I'm a CodeCaptionNode.

I have all references to the source code that the CodeCaptionComment references.

"
Class {
	#name : #CodeCaptionNode,
	#superclass : #Object,
	#instVars : [
		'classNode',
		'methodNode',
		'node'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #accessing }
CodeCaptionNode >> classNode [
	^ classNode
]

{ #category : #accessing }
CodeCaptionNode >> classNode: anObject [
	classNode := anObject
]

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
