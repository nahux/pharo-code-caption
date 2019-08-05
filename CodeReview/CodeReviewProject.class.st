"
Comments for a project
"
Class {
	#name : #CodeReviewProject,
	#superclass : #Object,
	#instVars : [
		'project',
		'comments'
	],
	#category : #CodeReview
}

{ #category : #adding }
CodeReviewProject >> addComment:aComment [
	comments add: aComment
]

{ #category : #accessing }
CodeReviewProject >> comments [
	^ comments
]

{ #category : #accessing }
CodeReviewProject >> comments: anObject [
	comments := anObject
]

{ #category : #initialization }
CodeReviewProject >> initialize [
	comments:= OrderedCollection new.
]

{ #category : #accessing }
CodeReviewProject >> project [
	^ project
]

{ #category : #accessing }
CodeReviewProject >> project: anObject [
	project := anObject
]
