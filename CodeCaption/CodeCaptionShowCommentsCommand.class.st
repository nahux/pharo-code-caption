"
I'm a command to show all code captions in a package
"
Class {
	#name : #CodeCaptionShowCommentsCommand,
	#superclass : #SycMethodCommand,
	#instVars : [
		'method',
		'codeCaptionProject',
		'packageName',
		'package'
	],
	#category : #'CodeCaption-UI Context'
}

{ #category : #activation }
CodeCaptionShowCommentsCommand class >> methodContextMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byItemOf: CmdExtraMenuGroup for: ClyMethod asCalypsoItemContext
]

{ #category : #activation }
CodeCaptionShowCommentsCommand class >> methodTabIconActivation [
	<classAnnotation>
	
	^ClyBrowserTabCommandActivation for: ClyMethod asCalypsoItemContext
]

{ #category : #accessing }
CodeCaptionShowCommentsCommand >> defaultMenuIconName [
	^#recentMessages
]

{ #category : #accessing }
CodeCaptionShowCommentsCommand >> defaultMenuItemName [
	^'Show CodeCaption comments'
]

{ #category : #accessing }
CodeCaptionShowCommentsCommand >> description [
	^'Show all CodeCaption comments for the selected method'
]

{ #category : #execution }
CodeCaptionShowCommentsCommand >> execute [
	codeCaptionProject isNotNil
		ifFalse: [ self inform: 'No CodeCaptions found for this package.' ]
		ifTrue: [ 
			codeCaptionProject package isNotNil
				ifTrue: [ 
					(CodeCaptionListWindow on: codeCaptionProject) openWithSpec ];
				ifFalse: [ self inform: 'No CodeCaptions found for this package.' ] ]
]

{ #category : #execution }
CodeCaptionShowCommentsCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	
	method := aToolContext lastSelectedMethod.
	package := method package.
	codeCaptionProject:= CodeCaptionProject loadCodeCaptionProject: ('CodeCaptions/',package name,'_CodeCaptionProject.STON').
]
