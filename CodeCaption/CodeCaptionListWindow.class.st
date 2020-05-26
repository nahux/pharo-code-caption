"
I'm a window with a list of all Code Captions added
"
Class {
	#name : #CodeCaptionListWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'ccList',
		'codeCaptionProject'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #specs }
CodeCaptionListWindow class >> defaultSpec [
	^SpBoxLayout newVertical
		add: #ccList;
		yourself
]

{ #category : #initialization }
CodeCaptionListWindow >> initializePresenters [ 
	"Initialize the window layout"
	ccList:= self newTable
		addColumn: (SpStringTableColumn title: 'Comment' evaluated: #comment);
		addColumn: (SpStringTableColumn title: 'Resolved' evaluated: #resolved);
		addColumn: (SpStringTableColumn title: 'Author' evaluated: #author);
		yourself.
		
	self updatePresenter.
		
]

{ #category : #initialization }
CodeCaptionListWindow >> initializeWindow: aWindowPresenter [ 
	aWindowPresenter title: 'List of CodeCaption for ', codeCaptionProject package name.
]

{ #category : #'accessing model' }
CodeCaptionListWindow >> setModelBeforeInitialization: aCodeCaptionProject [
	super setModelBeforeInitialization: aCodeCaptionProject.
	codeCaptionProject:= aCodeCaptionProject.
]

{ #category : #initialization }
CodeCaptionListWindow >> updatePresenter [
	ccList items: codeCaptionProject codeCaptions asOrderedCollection.
		
]
