"
Context Menu for the ""Add Caption Button"".

"
Class {
	#name : #ClyCodeCaptionCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'node'
	],
	#category : #'CodeCaption-UI Context'
}

{ #category : #activation }
ClyCodeCaptionCommand class >> sourceCodeMenuActivation [
	<classAnnotation>
	
	^SycSourceCodeMenuActivation byRootGroupItemOrder: 100000 for: ClyMethodSourceCodeContext
]

{ #category : #execution }
ClyCodeCaptionCommand >> applyResultInContext: aToolContext [
	aToolContext selectedSourceNode.
]

{ #category : #accessing }
ClyCodeCaptionCommand >> defaultMenuIconName [
	^#recentMessages
]

{ #category : #accessing }
ClyCodeCaptionCommand >> defaultMenuItemName [
	^'Add Code Caption'.
]

{ #category : #execution }
ClyCodeCaptionCommand >> execute [
	(CodeCaptionWindow on: (CodeCaptionComment newWithNode: node)) openWithSpec.
]

{ #category : #accessing }
ClyCodeCaptionCommand >> node [
	^ node
]

{ #category : #accessing }
ClyCodeCaptionCommand >> node: anObject [
	node := anObject
]

{ #category : #execution }
ClyCodeCaptionCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	
	node := aToolContext selectedSourceNode  .
]
