"
Comments for a project
"
Class {
	#name : #CodeCaptionProject,
	#superclass : #Object,
	#instVars : [
		'project',
		'codeCaptions',
		'package'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #adding }
CodeCaptionProject >> addCodeCaption:aComment [
	codeCaptions add: aComment
]

{ #category : #accessing }
CodeCaptionProject >> codeCaptions [
	^ codeCaptions
]

{ #category : #accessing }
CodeCaptionProject >> codeCaptions: anObject [
	codeCaptions := anObject
]

{ #category : #initialization }
CodeCaptionProject >> initialize [
	codeCaptions:= OrderedCollection new.
]

{ #category : #accessing }
CodeCaptionProject >> package [
	^ package
]

{ #category : #accessing }
CodeCaptionProject >> package: anObject [
	package := anObject
]

{ #category : #accessing }
CodeCaptionProject >> project [
	^ project
]

{ #category : #accessing }
CodeCaptionProject >> project: anObject [
	project := anObject
]
