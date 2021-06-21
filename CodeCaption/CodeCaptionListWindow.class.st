"
I'm a window with a list of all Code Captions added
"
Class {
	#name : #CodeCaptionListWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'ccList',
		'btnSync',
		'codeCaptionProject'
	],
	#category : #'CodeCaption-UI'
}

{ #category : #specs }
CodeCaptionListWindow class >> defaultSpec [
	^SpBoxLayout newVertical
		add: #ccList;
		add: (SpBoxLayout newHorizontal
				add: #btnSync;
				yourself) height: 30;
		yourself
]

{ #category : #'accessing model' }
CodeCaptionListWindow >> codeCaptionProject [
	^ codeCaptionProject 
]

{ #category : #initialization }
CodeCaptionListWindow >> connectPresenters [
	"Add the CodeCaption to the project and open the project window"

	btnSync
		action: [ 
			self syncCodeCaptionProject.
		].
]

{ #category : #initialization }
CodeCaptionListWindow >> initializePresenters [
	"Initialize the window layout"

	ccList := self newTable
		addColumn: (SpStringTableColumn title: 'Reference' evaluated: #nodeFound);
		addColumn: (SpStringTableColumn title: 'Method' evaluated: #methodName);
		addColumn: (SpStringTableColumn title: 'Comment' evaluated: #comment);
		addColumn: (SpStringTableColumn title: 'Author' evaluated: #author);
		activateOnDoubleClick;
		whenActivatedDo:
				[ :selection | (CodeCaptionWindow on: selection selectedItem) openWithSpec ].
	"TODO: add class"

	"Actions"
	btnSync := self newButton.
	btnSync label: 'Sync with remote'.
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

{ #category : #actions }
CodeCaptionListWindow >> syncCodeCaptionProject [
	| package repository |
	"TODO: improve this package detection. CodeCaptionProject needs IcePackes, not RPackages so this mess is needed"
	package := codeCaptionProject packages detect: [ :p | p isNotNil ].
	repository := CodeCaptionProject
		getRepositoryForPackageName: package name.
	codeCaptionProject := CodeCaptionProject
		syncAndLoadProjectDir: codeCaptionProject gitDirectory
		packages: repository workingCopy packages.
	codeCaptionProject pushCodeCaptionsToRemote
]

{ #category : #initialization }
CodeCaptionListWindow >> updatePresenter [
	ccList items: codeCaptionProject codeCaptions asOrderedCollection.
		
]
