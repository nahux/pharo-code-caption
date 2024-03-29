"
I'm a window with a list of all Code Captions added
"
Class {
	#name : #CodeCaptionListWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'ccList',
		'btnRefresh',
		'codeCaptionProject'
	],
	#category : #'CodeCaption-UI'
}

{ #category : #specs }
CodeCaptionListWindow class >> defaultSpec [
	^SpBoxLayout newVertical
		add: #ccList;
		add: (SpBoxLayout newHorizontal
				add: #btnRefresh width: 60;
				yourself) height: 30;
		yourself
]

{ #category : #action }
CodeCaptionListWindow >> browseMethod: aCodeCaption [

	[(aCodeCaption captionSource nodeClass
	 >> ccList selectedItem captionSource methodNode selector asSymbol)
		compiledMethod browse] on: Error do: [self inform: 'The method is no longer accesible'].
	
]

{ #category : #'accessing model' }
CodeCaptionListWindow >> codeCaptionProject [
	^ codeCaptionProject 
]

{ #category : #initialization }
CodeCaptionListWindow >> connectPresenters [

	| repository |
	btnRefresh action: [ 
		repository := CodeCaptionProject getRepositoryForPackageName:
			              codeCaptionProject packages anyOne name.
		repository isNotNil ifTrue: [ 
			repository repositoryDirectory isNotNil ifTrue: [ 
				codeCaptionProject := CodeCaptionProject
					                      loadProject:
					                      (CodeCaptionProject 
						                       codeCaptionsDirectoryForRepository:
						                       repository)
					                      packages: repository workingCopy packages ] ].
		self updatePresenter ]
]

{ #category : #initialization }
CodeCaptionListWindow >> initializePresenters [
	"Initialize the window layout"
	btnRefresh := self newButton.
	btnRefresh label: 'Refresh'.
	ccList := self newTable.
	ccList
		addColumn: (SpStringTableColumn title: 'Method' evaluated: #fullMethodName);
		addColumn: (SpStringTableColumn title: 'Comment' evaluated: #comment);
		addColumn: (SpStringTableColumn title: 'Author' evaluated: #author);
		addColumn: (SpStringTableColumn title: 'Reference' evaluated: #nodeFound);
		addColumn: (SpStringTableColumn title: 'Date' evaluated: #timeStamp);
		activateOnDoubleClick;
		beResizable;
		contextMenu:
			(SpMenuPresenter new
				addItem: [ :item | 
					item
						name: 'Browse';
						icon: (self iconNamed: #browse); "TODO: not working"
						action: [
							self browseMethod: ccList selectedItem
						]
				]);
		whenActivatedDo:
				[ :selection | (CodeCaptionWindow on: selection selectedItem) openWithSpec ].
]

{ #category : #initialization }
CodeCaptionListWindow >> initializeWindow: aWindowPresenter [ 
	aWindowPresenter title: 'List of CodeCaption for ', codeCaptionProject gitDirectory .
]

{ #category : #'accessing - model' }
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
