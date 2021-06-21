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
		'btnResolve',
		'editMode'
	],
	#category : #'CodeCaption-UI'
}

{ #category : #specs }
CodeCaptionWindow class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #sourceCode;
		add: #whiteSpace height: 20;
		add: #textArea height: 50;
		add:
			(SpBoxLayout newHorizontal
				add: #btnAdd;
				add: #btnResolve;
				yourself) height: 30;
		yourself.
]

{ #category : #adding }
CodeCaptionWindow >> addCodeCaptionToProject [
	codeCaption
		comment: self textArea text;
		author: Author uniqueInstance fullName.
	codeCaptionProject
		addCodeCaption: codeCaption;
		addPackage: codeCaption package.
]

{ #category : #accessing }
CodeCaptionWindow >> btnAdd [
	^ btnAdd
]

{ #category : #accessing }
CodeCaptionWindow >> btnResolve [
	^ btnResolve
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
		action: [ 
			self addCodeCaptionToProject.
			self saveCodeCaptionToProject: false.
			self openCodeCaptionListWindow.
			self window close ].
	btnResolve
		ifNotNil: [ 
			btnResolve
				action: [ 
					self codeCaptionProject resolveCodeCaption: self codeCaption.
					self saveCodeCaptionToProject: true.
					self openCodeCaptionListWindow.
					self window close ] ]
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
	btnResolve:= self newButton.
	btnResolve label: 'Resolve'.

	"Setting up Widgets"
	sourceCode text: codeCaption captionSource node newSource; enabled: false; withScrollBars.
	textArea autoAccept: true; withScrollBars.
	editMode 
		ifTrue:[
			btnAdd label: 'Apply'. 
			codeCaption resolved ifTrue: [ btnResolve disable ].
		] 
		ifFalse:[ 
			btnAdd label: 'Add'. 
			btnResolve disable
		].
	
	"Layout order"
	self focusOrder
		add: sourceCode;
		add: whiteSpace;
		add: textArea;
		add: btnAdd;
		add: btnResolve.
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

{ #category : #saving }
CodeCaptionWindow >> saveCodeCaptionToProject: isResolve [
	| repository commitText |
	commitText := isResolve
		ifTrue: [ 'Resolved CodeCaption: ' ]
		ifFalse: [ 'Added new CodeCaption: ' ].
	commitText := commitText , '"' , codeCaption comment , '"'.
	repository := IceRepository registry
		detect: [ :each | each includesPackageNamed: codeCaption package name ].
	codeCaptionProject
		saveCodeCaptionProjectTo: (CodeCaptionProject codeCaptionsDirectoryForRepository: repository)
		withText: commitText
		andAuthor: codeCaption author
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

	"TODO: add error/warning when repository repositoryDirectory is nil. It needs a repository"
	repository := IceRepository registry
		detect: [ :each | each includesPackageNamed: package name ].

	codeCaptionProject := CodeCaptionProject
		loadProject: (CodeCaptionProject codeCaptionsDirectoryForRepository: repository)
		packages: (repository workingCopy packages).
	codeCaptionProject
		ifNil: [ codeCaptionProject := CodeCaptionProject new.
			codeCaptionProject
				name: repository name;
				addPackage: package;
				gitDirectory: 'pharo-local/' , repository repositoryDirectory path pathString ]
]

{ #category : #accessing }
CodeCaptionWindow >> textArea [
	^ textArea
]

{ #category : #accessing }
CodeCaptionWindow >> textArea: anObject [
	textArea := anObject
]
