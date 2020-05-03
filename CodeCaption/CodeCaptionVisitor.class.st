"
Visitor of SmaCC java nodes
"
Class {
	#name : #CodeCaptionVisitor,
	#superclass : #JavaProgramNodeVisitor,
	#instVars : [
		'classes',
		'statements'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #accessing }
CodeCaptionVisitor >> classes [
	^ classes
]

{ #category : #accessing }
CodeCaptionVisitor >> classes: anObject [
	classes := anObject
]

{ #category : #visiting }
CodeCaptionVisitor >> initialize [
	classes:= OrderedCollection new.
	statements:= OrderedCollection new.
]

{ #category : #accessing }
CodeCaptionVisitor >> statements [
	^ statements
]

{ #category : #accessing }
CodeCaptionVisitor >> statements: anObject [
	statements := anObject
]

{ #category : #visiting }
CodeCaptionVisitor >> visitClassDeclaration: aClassDeclarationNode [  
	classes add: aClassDeclarationNode.
	aClassDeclarationNode declarations do: [ :c | c acceptVisitor: self ]
]

{ #category : #visiting }
CodeCaptionVisitor >> visitExpressionStatement: anExpressionStatement [  
	statements add: anExpressionStatement.
]

{ #category : #visiting }
CodeCaptionVisitor >> visitSourceCode: aCompilationNode [
	aCompilationNode  acceptVisitor: self.
]
