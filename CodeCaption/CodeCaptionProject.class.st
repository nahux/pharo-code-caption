"
Comments for a project
"
Class {
	#name : #CodeCaptionProject,
	#superclass : #Object,
	#instVars : [
		'project',
		'codeCaptions'
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
CodeCaptionProject >> project [
	^ project
]

{ #category : #accessing }
CodeCaptionProject >> project: anObject [
	project := anObject
]
