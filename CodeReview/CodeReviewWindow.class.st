"
Soy una ventana de prueba Spec para comentarios
"
Class {
	#name : #CodeReviewWindow,
	#superclass : #ComposablePresenter,
	#instVars : [
		'project',
		'textArea',
		'btnAdd'
	],
	#category : #CodeReview
}

{ #category : #specs }
CodeReviewWindow class >> defaultSpec [
	^ SpecLayout composed
	newRow: [ :row | row add: #textArea ]
	origin: 0 @ 0 corner: 1 @ 0.7;
	newRow: [ :row | row add: #btnAdd ]
	origin: 0 @ 0.7 corner: 1 @ 1;
	yourself
]

{ #category : #accessing }
CodeReviewWindow >> btnAdd [
	^ btnAdd
]

{ #category : #accessing }
CodeReviewWindow >> btnAdd: anObject [
	btnAdd := anObject
]

{ #category : #initialization }
CodeReviewWindow >> initializePresenter [
	project:= CodeReviewProject new.
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
CodeReviewWindow >> initializeWidgets [
	project:= CodeReviewProject new.
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
CodeReviewWindow >> initializeWindow [
	btnAdd
		action:
			[ project addComment: (CodeComment newWithText: self textArea text) ]
]

{ #category : #accessing }
CodeReviewWindow >> project [
	^ project
]

{ #category : #accessing }
CodeReviewWindow >> project: anObject [
	project := anObject
]

{ #category : #accessing }
CodeReviewWindow >> textArea [
	^ textArea
]

{ #category : #accessing }
CodeReviewWindow >> textArea: anObject [
	textArea := anObject
]
