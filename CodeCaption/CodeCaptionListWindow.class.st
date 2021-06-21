"
I'm a window with a list of all Code Captions added
"
Class {
	#name : #CodeCaptionListWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'ccList',
		'btnSync',
		'btnResolve',
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
				add: #btnResolve;
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
	btnResolve
		ifNotNil: [ 
			btnResolve
				action: [ 
					"self codeCaptionProject resolveCodeCaption: self codeCaption.
					self saveCodeCaptionProject.
					self openCodeCaptionListWindow.
					self window close" ] ]
]

{ #category : #initialization }
CodeCaptionListWindow >> initializePresenters [
	"Initialize the window layout"

	ccList := self newTable
		"TODO: add class"
		addColumn: (SpStringTableColumn title: 'Reference' evaluated: #nodeFound);
		addColumn: (SpStringTableColumn title: 'Method' evaluated: #methodName);
		addColumn: (SpStringTableColumn title: 'Comment' evaluated: #comment);
		addColumn: (SpStringTableColumn title: 'Resolved' evaluated: #resolved);
		addColumn: (SpStringTableColumn title: 'Author' evaluated: #author);
		activateOnDoubleClick;
		whenActivatedDo:
				[ :selection | (CodeCaptionWindow on: selection selectedItem) openWithSpec ].
	
	"Actions"
	btnSync := self newButton.
	btnSync label: 'Sync with remote'.
	btnResolve:= self newButton.
	btnResolve label: 'Resolve'.
	
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
	| packages |
	packages:= codeCaptionProject packages. 
"codeCaptionProject := CodeCaptionProject
						loadProject: (CodeCaptionProject codeCaptionsDirectoryForRepository: repository)
						package: package ]"
]

{ #category : #initialization }
CodeCaptionListWindow >> updatePresenter [
	ccList items: codeCaptionProject codeCaptions asOrderedCollection.
		
]
