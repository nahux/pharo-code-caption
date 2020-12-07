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
	#category : #'CodeCaption-UI'
}

{ #category : #specs }
CodeCaptionListWindow class >> defaultSpec [
	^SpBoxLayout newVertical
		add: #ccList;
		yourself
]

{ #category : #'accessing model' }
CodeCaptionListWindow >> codeCaptionProject [
	^ codeCaptionProject 
]

{ #category : #initialization }
CodeCaptionListWindow >> initializePresenters [
	"Initialize the window layout"

	ccList := self newTable
		"TODO: add class"
		addColumn: (SpStringTableColumn title: 'Method' evaluated: #methodName);
		addColumn: (SpStringTableColumn title: 'Comment' evaluated: #comment);
		addColumn: (SpStringTableColumn title: 'Resolved' evaluated: #resolved);
		addColumn: (SpStringTableColumn title: 'Author' evaluated: #author);
		activateOnDoubleClick;
		whenActivatedDo:
				[ :selection | (CodeCaptionWindow on: selection selectedItem) openWithSpec ].
	self updatePresenter
]

{ #category : #initialization }
CodeCaptionListWindow >> initializeWindow: aWindowPresenter [ 
	aWindowPresenter title: 'List of CodeCaption for ', codeCaptionProject gitDirectory .
]

{ #category : #'accessing model' }
CodeCaptionListWindow >> setModelBeforeInitialization: aCodeCaptionProject [
	super setModelBeforeInitialization: aCodeCaptionProject.
	self class
		allInstancesDo: [ :w | 
			w codeCaptionProject
				ifNotNil: [ w codeCaptionProject name
						ifNotNil: [ w codeCaptionProject name = aCodeCaptionProject name
								ifTrue: [ w delete ] ] ] ].
	codeCaptionProject := aCodeCaptionProject
]

{ #category : #initialization }
CodeCaptionListWindow >> updatePresenter [
	ccList items: codeCaptionProject codeCaptions asOrderedCollection.
		
]
