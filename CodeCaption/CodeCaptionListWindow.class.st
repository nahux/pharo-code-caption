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

	ccList := self newTable.
	ccList
		addColumn: (SpStringTableColumn title: 'Method' evaluated: #fullMethodName);
		addColumn: (SpStringTableColumn title: 'Comment' evaluated: #comment);
		addColumn: (SpStringTableColumn title: 'Author' evaluated: #author);
		addColumn: (SpStringTableColumn title: 'Reference' evaluated: #nodeFound);
		activateOnDoubleClick;
		contextMenu:
			(SpMenuPresenter new
				addItem: [ :item | 
					item
						name: 'Browse';
						icon: (self iconNamed: #browse); "TODO: not working"
						action: [
							((ccList selectedItem captionSource nodeClass)>>(ccList selectedItem captionSource methodNode selector asSymbol)) compiledMethod browse
						]
				]);
		whenActivatedDo:
				[ :selection | (CodeCaptionWindow on: selection selectedItem) openWithSpec ].
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
