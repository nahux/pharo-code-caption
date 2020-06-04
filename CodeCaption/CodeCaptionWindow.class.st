"
Soy una ventana de prueba Spec para comentarios
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
		'btnAdd'
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
	codeCaption comment: self textArea text; author: Author uniqueInstance fullName.
	codeCaptionProject 
		addCodeCaption: codeCaption; 
		package: (codeCaption node methodNode methodClass package).
	codeCaptionProject saveCodeCaptionProjectTo: ('CodeCaptions/',codeCaptionProject package name,'_CodeCaptionProject.STON').
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
			[ self addCodeCaptionToProject. self openCodeCaptionListWindow ]
]

{ #category : #initialization }
CodeCaptionWindow >> initializePresenters [
	"Initialize widgets"
	label := self newLabel.
	sourceCode := self newCode.
	sourceCode withoutSyntaxHighlight.
	whiteSpace := self newNullPresenter.
	textArea := self newText.
	btnAdd := self newButton.

	"Setting up Widgets"
	sourceCode text: codeCaption node sourceCode; enabled: false; withScrollBars.
	textArea autoAccept: true; withScrollBars.
	btnAdd label: 'Add'.
	
	
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

{ #category : #initialization }
CodeCaptionWindow >> setModelBeforeInitialization: aCodeCaptionComment [
	| package |
	super setModelBeforeInitialization: aCodeCaptionComment.
	codeCaption := aCodeCaptionComment.
	package := codeCaption node methodNode methodClass package.
	codeCaptionProject := CodeCaptionProject loadCodeCaptionProject:('CodeCaptions/',package name , '_captions.STON').
	codeCaptionProject ifNil: [ 
		codeCaptionProject := CodeCaptionProject new.
		codeCaptionProject package: package ]
]

{ #category : #accessing }
CodeCaptionWindow >> textArea [
	^ textArea
]

{ #category : #accessing }
CodeCaptionWindow >> textArea: anObject [
	textArea := anObject
]
