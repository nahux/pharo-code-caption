"
Context Menu for the ""Add Caption Button"".

"
Class {
	#name : #CodeCaptionAddCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'node'
	],
	#category : #'CodeCaption-UI Context'
}

{ #category : #testing }
CodeCaptionAddCommand class >> canBeExecutedInContext: aToolContext [
	^ (Smalltalk globals includesKey: #IceLog)
		and: [ (IceRepository registeredRepositoryIncludingPackage: aToolContext lastSelectedMethod package) notNil ]
]

{ #category : #activation }
CodeCaptionAddCommand class >> sourceCodeMenuActivation [
	<classAnnotation>
	
	^SycSourceCodeMenuActivation byRootGroupItemOrder: 100000 for: ClyMethodSourceCodeContext
]

{ #category : #execution }
CodeCaptionAddCommand >> applyResultInContext: aToolContext [
	aToolContext selectedSourceNode.
]

{ #category : #accessing }
CodeCaptionAddCommand >> defaultMenuIconName [
	^#recentMessages
]

{ #category : #accessing }
CodeCaptionAddCommand >> defaultMenuItemName [
	^'Add Code Caption'.
]

{ #category : #execution }
CodeCaptionAddCommand >> execute [
	(CodeCaptionWindow on: (CodeCaptionComment newWithNode: node)) openWithSpec.
]

{ #category : #accessing }
CodeCaptionAddCommand >> node [
	^ node
]

{ #category : #accessing }
CodeCaptionAddCommand >> node: anObject [
	node := anObject
]

{ #category : #execution }
CodeCaptionAddCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	
	node := aToolContext selectedSourceNode  .
]
