"
I'm the window for adding a new Code Caption comment to the project.
"
Class {
	#name : #CodeCaptionWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'codeCaption',
		'codeCaptionProject',
		'label',
		'sourceCode',
		'whiteSpace',
		'textArea',
		'btnAdd',
		'editMode'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #specs }
CodeCaptionWindow class >> defaultSpec [
	^ SpBoxLayout newVertical 
		add: #sourceCode;
		add: #whiteSpace height: 20;
		add: #textArea height: 50;
		add: #btnAdd height: 40;
	yourself
]

{ #category : #adding }
CodeCaptionWindow >> addCodeCaptionToProject [
	codeCaption
		comment: self textArea text;
		author: Author uniqueInstance fullName.
	codeCaptionProject
		addCodeCaption: codeCaption;
		addPackage: codeCaption package.
	codeCaptionProject
		saveCodeCaptionProjectTo:
			'pharo-local/'
				,
					(IceRepository registry
						detect: [ :each | each includesPackageNamed: codeCaption package name ])
						repositoryDirectory path pathString , '/CodeCaptions/'
				, codeCaption package name
				, '_CodeCaptions.STON'
]

{ #category : #accessing }
CodeCaptionWindow >> btnAdd [
	^ btnAdd
]

{ #category : #accessing }
CodeCaptionWindow >> btnAdd: anObject [
	btnAdd := anObject
]

{ #category : #accessing }
CodeCaptionWindow >> codeCaption [
	^ codeCaption
]

{ #category : #accessing }
CodeCaptionWindow >> codeCaption: aCodeCaptionComment [ 
	codeCaption:= aCodeCaptionComment
]

{ #category : #accessing }
CodeCaptionWindow >> codeCaptionProject [
	^ codeCaptionProject
]

{ #category : #accessing }
CodeCaptionWindow >> codeCaptionProject: anObject [
	codeCaptionProject := anObject
]

{ #category : #initialization }
CodeCaptionWindow >> connectPresenters [
	"Add the CodeCaption to the project and open the project window"
	btnAdd
		action:
			[ self addCodeCaptionToProject. self openCodeCaptionListWindow. self window close]
]

{ #category : #accessing }
CodeCaptionWindow >> editMode [
	^ editMode
]

{ #category : #accessing }
CodeCaptionWindow >> editMode: anObject [
	editMode := anObject
]

{ #category : #initialization }
CodeCaptionWindow >> initializePresenters [
	"Initialize widgets"
	label := self newLabel.
	sourceCode := self newCode.
	sourceCode withoutSyntaxHighlight.
	whiteSpace := self newNullPresenter.
	textArea := self newText.
	codeCaption comment ifNotNil: [ textArea text: codeCaption comment ].
	btnAdd := self newButton.

	"Setting up Widgets"
	sourceCode text: codeCaption node newSource; enabled: false; withScrollBars.
	textArea autoAccept: true; withScrollBars.
	editMode ifTrue:[btnAdd label: 'Apply'] ifFalse:[ btnAdd label: 'Add'].
	
	
	"Layout order"
	self focusOrder
		add: sourceCode;
		add: whiteSpace;
		add: textArea;
		add: btnAdd.
]

{ #category : #initialization }
CodeCaptionWindow >> initializeWindow: aWindowPresenter [ 
	aWindowPresenter title: 'CodeCaption'.
]

{ #category : #accessing }
CodeCaptionWindow >> label [
	^ label
]

{ #category : #accessing }
CodeCaptionWindow >> label: anObject [
	label := anObject
]

{ #category : #adding }
CodeCaptionWindow >> openCodeCaptionListWindow [
	(CodeCaptionListWindow on: (codeCaptionProject)) openWithSpec.
]

{ #category : #accessing }
CodeCaptionWindow >> screen [
	^ sourceCode
]

{ #category : #accessing }
CodeCaptionWindow >> screen: anObject [
	sourceCode := anObject
]

{ #category : #'accessing model' }
CodeCaptionWindow >> setModelBeforeInitialization: aCodeCaptionComment [
	| package repository |
	super setModelBeforeInitialization: aCodeCaptionComment.
	codeCaption := aCodeCaptionComment.
	editMode := codeCaption comment ifNil: [ false ] ifNotNil: [ true ].
	package := codeCaption package.
	
	repository := IceRepository registry
		detect: [ :each | each includesPackageNamed: package name ].
	
	"TODO: Fix this so many packages are available"
	codeCaptionProject := CodeCaptionProject
		loadCodeCaptionProject:
			'pharo-local/'
				, repository repositoryDirectory path pathString
				, '/CodeCaptions/' , package name , '_CodeCaptions.STON'.
	codeCaptionProject
		ifNil: [ codeCaptionProject := CodeCaptionProject new.
			codeCaptionProject
				addPackage: package;
				gitDirectory:
					'pharo-local/'
						, repository repositoryDirectory path pathString ]
]

{ #category : #accessing }
CodeCaptionWindow >> textArea [
	^ textArea
]

{ #category : #accessing }
CodeCaptionWindow >> textArea: anObject [
	textArea := anObject
]
