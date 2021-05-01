"
Comments for a project
"
Class {
	#name : #CodeCaptionProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'codeCaptions',
		'packages',
		'gitDirectory'
	],
	#category : #'CodeCaption-Caption'
}

{ #category : #'instance creation' }
CodeCaptionProject class >> codeCaptionsDirectoryForRepository: anIceLibgitRepository [
	^ 'pharo-local/'
		, anIceLibgitRepository repositoryDirectory path pathString
		, '/CodeCaptions/' , anIceLibgitRepository name
		, '_CodeCaptions.STON'
]

{ #category : #'instance creation' }
CodeCaptionProject class >> loadProject: aFilePath package: aPackage [
	| working_dir fstream |
	working_dir := FileSystem disk workingDirectory.
	(working_dir/aFilePath) exists
	ifTrue: [ fstream := (working_dir/aFilePath) readStream. ^(STON fromString: (fstream contents)) loadNodesForPackage: aPackage.]
	ifFalse: [ ^nil ].
	
]

{ #category : #adding }
CodeCaptionProject >> addCodeCaption: aComment [
	codeCaptions remove: aComment ifAbsent: [].
	codeCaptions add: aComment
]

{ #category : #accessing }
CodeCaptionProject >> addPackage: aPackage [ 
	packages add: aPackage
]

{ #category : #accessing }
CodeCaptionProject >> codeCaptions [
	^ codeCaptions
]

{ #category : #accessing }
CodeCaptionProject >> codeCaptions: anObject [
	codeCaptions := anObject
]

{ #category : #accessing }
CodeCaptionProject >> gitDirectory [
	^ gitDirectory
]

{ #category : #accessing }
CodeCaptionProject >> gitDirectory: anObject [
	gitDirectory := anObject
]

{ #category : #initialization }
CodeCaptionProject >> initialize [
	codeCaptions:= Set new.
	packages:= Set new.
]

{ #category : #'file in/out' }
CodeCaptionProject >> loadCaptions: aFilePath [
	| working_dir fstream |
	working_dir := FileSystem disk workingDirectory.
	fstream := (working_dir / aFilePath) readStream.
	codeCaptions := STON fromSton: fstream contents.
	fstream close.
]

{ #category : #'file in/out' }
CodeCaptionProject >> loadNodesForPackage: aPackage [
	| allMethods foundMethod |
	allMethods := aPackage methods.
	codeCaptions
		do: [ :c | 
			c package: aPackage.
			c captionSource node: (Object readFrom: c captionSource node).
			c captionSource
				methodNode: (Object readFrom: c captionSource methodNode).
			foundMethod := nil.
			allMethods
				do: [ :pm | 
					"Check if method and class pairing from CodeCaption File exists in the source code"
					(pm methodNode selector = c captionSource methodNode selector
						and: pm methodNode methodClass = c captionSource nodeClass)
						ifTrue: [ foundMethod := pm methodNode ] ].
			foundMethod
				ifNotNil: [ c captionSource methodNode: foundMethod.
					"Search the CodeCaptionComment node in the methodNode to see if it was modified"
					c
						nodeFound: (self method: foundMethod hasNode: c captionSource node) ] ]
]

{ #category : #helper }
CodeCaptionProject >> method: aMethodNode hasNode: anRBProgramNode [
	| visitor |
	"Check if both are the same node (same method node)"
	(anRBProgramNode isMethod) ifTrue: [(aMethodNode body = anRBProgramNode body) ifTrue: [ ^ true ]].
	visitor := CodeCaptionRBNodeMatcher newWithNode: anRBProgramNode.
	aMethodNode acceptVisitor: visitor.
	visitor astNode ifNotNil: [ ^ true ] ifNil: [ ^ false ]
]

{ #category : #accessing }
CodeCaptionProject >> name [
	^ name
]

{ #category : #accessing }
CodeCaptionProject >> name: aProjectName [
	name := aProjectName
]

{ #category : #accessing }
CodeCaptionProject >> packages [
	^ packages
]

{ #category : #accessing }
CodeCaptionProject >> packages: aCollection [
	packages := aCollection
]

{ #category : #actions }
CodeCaptionProject >> resolveCodeCaption: aCodeCaptionComment [
	codeCaptions remove: aCodeCaptionComment. 
]

{ #category : #'file in/out' }
CodeCaptionProject >> saveCodeCaptionProjectTo: aFilePath withText: aCommentText andAuthor: anAuthorName [
	| ston workingDir fstream fullRepositoryPath commitText |
	ston := STON toStringPretty: self.
	workingDir := FileSystem disk workingDirectory.
	(workingDir / aFilePath) ensureCreateFile.
	fstream := (workingDir / aFilePath) writeStream.
	fstream nextPutAll: ston.
	fstream close.
	"Commit changes (not on windows)"
	fullRepositoryPath := (workingDir / aFilePath) asPath parent parent pathString.
	commitText:= '[CodeCaption] Added new CodeCaption: "', aCommentText , '" by: "', anAuthorName , '"'.
	Smalltalk os isWindows ifTrue: [ ^ self ].
	OSSUnixSubprocess new
		command: '/usr/bin/git';
		arguments:
			(Array
				with: '-C'
				with: fullRepositoryPath
				with: 'add'
				with: 'CodeCaptions/');
		runAndWait.
	OSSUnixSubprocess new
		command: '/usr/bin/git';
		arguments:
			(Array
				with: '-C'
				with: fullRepositoryPath
				with: 'commit'
				with: '-m'
				with: commitText);
		run
]
