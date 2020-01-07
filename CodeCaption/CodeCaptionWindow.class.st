"
Soy una ventana de prueba Spec para comentarios
"
Class {
	#name : #CodeCaptionWindow,
	#superclass : #ComposablePresenter,
	#instVars : [
		'project',
		'textArea',
		'btnAdd'
	],
	#category : #CodeCaption
}

{ #category : #specs }
CodeCaptionWindow class >> defaultSpec [
	^ SpecLayout composed
	newRow: [ :row | row add: #textArea ]
	origin: 0 @ 0 corner: 1 @ 0.7;
	newRow: [ :row | row add: #btnAdd ]
	origin: 0 @ 0.7 corner: 1 @ 1;
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
CodeCaptionWindow >> initializePresenter [
	project:= CodeCaptionProject new.
	"Inicializo los widgets"
	btnAdd := self newButton.
	textArea := self newText.

	"Configuro widgets"
	btnAdd label: 'Agregar'.
	textArea autoAccept: true.
	
	"Especifico el orden"
	self focusOrder
		add: textArea;
		add: btnAdd.
		
]

{ #category : #initialization }
CodeCaptionWindow >> initializeWidgets [
	project:= CodeCaptionProject new.
	"Inicializo los widgets"
	btnAdd := self newButton.
	textArea := self newText.

	"Configuro widgets"
	btnAdd label: 'Agregar'.
	textArea autoAccept: true.
	
	"Especifico el orden"
	self focusOrder
		add: textArea;
		add: btnAdd.
		
]

{ #category : #initialization }
CodeCaptionWindow >> initializeWindow [
	btnAdd
		action:
			[ project addComment: (CodeCaptionComment newWithText: self textArea text) ]
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
CodeCaptionWindow >> textArea [
	^ textArea
]

{ #category : #accessing }
CodeCaptionWindow >> textArea: anObject [
	textArea := anObject
]
