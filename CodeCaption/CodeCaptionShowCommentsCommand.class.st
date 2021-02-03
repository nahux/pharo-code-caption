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
		ifTrue: [ (CodeCaptionListWindow on: codeCaptionProject) openWithSpec ]
]

{ #category : #execution }
CodeCaptionShowCommentsCommand >> prepareFullExecutionInContext: aToolContext [
	| repository |
	super prepareFullExecutionInContext: aToolContext.
	method := aToolContext lastSelectedMethod.
	package := method package.

	"Get repository from context"
	repository := IceRepository registry
		detect: [ :each | each includesPackageNamed: package name ]
		ifNone: [ codeCaptionProject := nil ].
	repository isNotNil
		ifTrue: [ repository repositoryDirectory isNotNil
				ifTrue: [ codeCaptionProject := CodeCaptionProject
						loadProject: (CodeCaptionProject codeCaptionsDirectoryForRepository: repository)
						package: package ] ]
]
