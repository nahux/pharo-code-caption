"
Soy una ventana de prueba Spec para comentarios
"
Class {
	#name : #CodeCaptionWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'codeCaption',
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
CodeCaptionWindow >> addCodeCaptionToPackage: package [
	| projectClass |
	projectClass:= package packageCodeCaption: ('CodeCaptionProject', package name onlyLetters).
	projectClass ifNil: [ self createCodeCaptionProjectFor: package name ]
				ifNotNil: [ "self addCodeCaptionToProject: (projectClass allInstances first)" ].

]

{ #category : #adding }
CodeCaptionWindow >> addCodeCaptionToProject: aCodeCaptionProject [
	codeCaption comment: self textArea text; author: Author uniqueInstance fullName. 
	aCodeCaptionProject addCodeCaption: codeCaption.
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

{ #category : #initialization }
CodeCaptionWindow >> connectPresenters [
	btnAdd
		action:
			[ self addCodeCaptionToPackage: (codeCaption node methodNode methodClass package) ]
]

{ #category : #adding }
CodeCaptionWindow >> createCodeCaptionProjectFor: packageName [
	|tag projectClass |
	tag := 'CodeCaptionProject'.
	projectClass:= CodeCaptionProject subclass: (tag, packageName onlyLetters) asSymbol
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			package: packageName.
	projectClass 
		tagWith: tag;
		comment: 'Code Caption Project to store all the Code Caption comments in the package'.
	self addCodeCaptionToProject: projectClass.
]

{ #category : #initialization }
CodeCaptionWindow >> initializePresenters [
	"Initialize widgets"
	label := self newLabel.
	sourceCode := self newCode.
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
	super setModelBeforeInitialization: aCodeCaptionComment.
	codeCaption:= aCodeCaptionComment.
]

{ #category : #accessing }
CodeCaptionWindow >> textArea [
	^ textArea
]

{ #category : #accessing }
CodeCaptionWindow >> textArea: anObject [
	textArea := anObject
]
