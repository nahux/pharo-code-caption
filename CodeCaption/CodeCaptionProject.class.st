"
Comments for a project
"
Class {
	#name : #CodeCaptionProject,
	#superclass : #Object,
	#instVars : [
		'project',
		'comments'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #adding }
CodeCaptionProject >> addComment:aComment [
	comments add: aComment
]

{ #category : #accessing }
CodeCaptionProject >> comments [
	^ comments
]

{ #category : #accessing }
CodeCaptionProject >> comments: anObject [
	comments := anObject
]

{ #category : #initialization }
CodeCaptionProject >> initialize [
	comments:= OrderedCollection new.
]

{ #category : #accessing }
CodeCaptionProject >> project [
	^ project
]

{ #category : #accessing }
CodeCaptionProject >> project: anObject [
	project := anObject
]
