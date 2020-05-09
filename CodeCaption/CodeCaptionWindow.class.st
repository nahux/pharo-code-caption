"
Soy una ventana de prueba Spec para comentarios
"
Class {
	#name : #CodeCaptionWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'project',
		'textArea',
		'btnAdd',
		'screen'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #specs }
CodeCaptionWindow class >> defaultSpec [
	^ SpBoxLayout newVertical 
		add: #screen height: 40;
		add: #textArea;
		add: #btnAdd height: 40;
	yourself
]

{ #category : #accessing }
CodeCaptionWindow >> btnAdd [
	^ btnAdd
]

{ #category : #accessing }
CodeCaptionWindow >> btnAdd: anObject [
	btnAdd := anObject
]

{ #category : #initialization }
CodeCaptionWindow >> connectPresenters [
	btnAdd
		action:
			[ project addComment: (CodeCaptionComment text: self textArea text author: Author uniqueInstance fullName  node: nil) inspect ]
]

{ #category : #initialization }
CodeCaptionWindow >> initializePresenters [
	project:= CodeCaptionProject new.
	"Initialize widgets"
	screen := self newLabel.
	btnAdd := self newButton.
	textArea := self newText.

	"Setting up Widgets"
	screen label: 'Add a comment to the code'.
	btnAdd label: 'Add'.
	textArea autoAccept: true.
	
	"Layout order"
	self focusOrder
		add: screen;
		add: textArea;
		add: btnAdd.
]

{ #category : #initialization }
CodeCaptionWindow >> initializeWindow: aWindowPresenter [ 
	aWindowPresenter title: 'CodeCaption'.
]

{ #category : #accessing }
CodeCaptionWindow >> project [
	^ project
]

{ #category : #accessing }
CodeCaptionWindow >> project: anObject [
	project := anObject
]

{ #category : #accessing }
CodeCaptionWindow >> screen [
	^ screen
]

{ #category : #accessing }
CodeCaptionWindow >> screen: anObject [
	screen := anObject
]

{ #category : #accessing }
CodeCaptionWindow >> textArea [
	^ textArea
]

{ #category : #accessing }
CodeCaptionWindow >> textArea: anObject [
	textArea := anObject
]
