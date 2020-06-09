"
I'm a window with a list of all Code Captions added
"
Class {
	#name : #CodeCaptionListWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'ccList',
		'ccDetail',
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

{ #category : #accessing }
CodeCaptionListWindow >> ccDetail [
	^ ccDetail
]

{ #category : #accessing }
CodeCaptionListWindow >> ccDetail: anObject [
	ccDetail := anObject
]

{ #category : #initialization }
CodeCaptionListWindow >> initializePresenters [ 
	"Initialize the window layout"
	ccList:= self newTable
		addColumn: (SpStringTableColumn title: 'Comment' evaluated: #comment);
		addColumn: (SpStringTableColumn title: 'Resolved' evaluated: #resolved);
		addColumn: (SpStringTableColumn title: 'Author' evaluated: #author);
		activateOnDoubleClick;
		whenActivatedDo: [ :selection | (CodeCaptionWindow on: (codeCaptionProject codeCaptions at: selection selectedIndex)) openWithSpec].
		
"	ccDetail:= self instantiate: CodeCaptionWindow.
	ccDetail enable: false.
	
	ccList transmitTo: ccDetail.
		"
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
