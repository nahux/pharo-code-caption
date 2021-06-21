"
I'm a Code Caption Comment.
I have the reference to a Node in the source code and a comment related to it.
"
Class {
	#name : #CodeCaptionComment,
	#superclass : #Object,
	#instVars : [
		'id',
		'repository',
		'package',
		'captionNode',
		'nodeFound',
		'comment',
		'author'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #'instance creation' }
CodeCaptionComment class >> newWithNode:aProgramNode package: anASTPackage methodNode:aMethodNode repository: anIceLibgitRepository [
	^ self new
		package: anASTPackage;
		captionSource: ((CodeCaptionSource new) node: aProgramNode; methodNode: aMethodNode; nodeClass: aMethodNode methodClass);
		repository: anIceLibgitRepository ;
		yourself.
]

{ #category : #initialization }
CodeCaptionComment >> = anotherCodeCaptionComment [
	^ self id = anotherCodeCaptionComment id
	
]

{ #category : #accessing }
CodeCaptionComment >> author [
	^ author
]

{ #category : #accessing }
CodeCaptionComment >> author: anObject [
	author := anObject
]

{ #category : #accessing }
CodeCaptionComment >> captionSource [
	^ captionNode
]

{ #category : #accessing }
CodeCaptionComment >> captionSource: aCodeCaptionSource [
	captionNode := aCodeCaptionSource
]

{ #category : #accessing }
CodeCaptionComment >> comment [
	^ comment
]

{ #category : #accessing }
CodeCaptionComment >> comment: anObject [
	comment := anObject
]

{ #category : #initialization }
CodeCaptionComment >> hash [
	^ self id
]

{ #category : #accessing }
CodeCaptionComment >> id [
	^ id
]

{ #category : #accessing }
CodeCaptionComment >> id: anObject [
	id := anObject
]

{ #category : #initialization }
CodeCaptionComment >> initialize [
	id := self identityHash.
	captionNode ifNil: [ captionNode := CodeCaptionSource new ]
]

{ #category : #accessing }
CodeCaptionComment >> methodClass [ 
	^ self captionSource methodNode methodClass
]

{ #category : #accessing }
CodeCaptionComment >> methodName [ 
	^ self captionSource methodNode selector
]

{ #category : #accessing }
CodeCaptionComment >> nodeFound [
	nodeFound ifNil: [ ^ false ] ifNotNil: [ ^ nodeFound ]
]

{ #category : #accessing }
CodeCaptionComment >> nodeFound: aBoolean [
	nodeFound := aBoolean
]

{ #category : #accessing }
CodeCaptionComment >> package [
	^ package
]

{ #category : #accessing }
CodeCaptionComment >> package: anObject [
	package := anObject
]

{ #category : #accessing }
CodeCaptionComment >> repository [
	^ repository
]

{ #category : #accessing }
CodeCaptionComment >> repository: anObject [
	repository := anObject
]
