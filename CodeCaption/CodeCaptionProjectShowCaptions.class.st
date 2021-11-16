"
I'm a command to show all code captions in a package
"
Class {
	#name : #CodeCaptionProjectShowCaptions,
	#superclass : #CmdCommand,
	#instVars : [
		'package',
		'repository',
		'codeCaptionProject'
	],
	#category : #'CodeCaption-UI Context'
}

{ #category : #activation }
CodeCaptionProjectShowCaptions class >> canBeExecutedInContext: aToolContext [
	^aToolContext isPackageSelected
]

{ #category : #activation }
CodeCaptionProjectShowCaptions class >> fullBrowserPackageMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byRootGroupItemFor: ClyFullBrowserPackageContext
]

{ #category : #accessing }
CodeCaptionProjectShowCaptions >> defaultMenuIconName [
	^#recentMessages
]

{ #category : #accessing }
CodeCaptionProjectShowCaptions >> defaultMenuItemName [
	^'Show CodeCaption comments'
]

{ #category : #accessing }
CodeCaptionProjectShowCaptions >> description [
	^'Show all CodeCaption comments for the selected method'
]

{ #category : #execution }
CodeCaptionProjectShowCaptions >> execute [
	codeCaptionProject isNotNil
		ifFalse: [ self inform: 'No CodeCaptions found for this package.' ]
		ifTrue: [ (CodeCaptionListWindow on: codeCaptionProject) openWithSpec ]
]

{ #category : #execution }
CodeCaptionProjectShowCaptions >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	package := aToolContext lastSelectedPackage.

	"Get repository from context"
	repository := CodeCaptionProject getRepositoryForPackageName: package name.
	repository isNotNil
		ifTrue: [ repository repositoryDirectory isNotNil
				ifTrue: [ codeCaptionProject := CodeCaptionProject
						loadProject: (CodeCaptionProject codeCaptionsDirectoryForRepository: repository)
						packages: repository workingCopy packages ] ]
]
