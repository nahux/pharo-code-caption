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
CodeCaptionProject class >> loadCodeCaptionProject: aFilePath [
	| working_dir fstream |
	working_dir := FileSystem disk workingDirectory.
	(working_dir/aFilePath) exists
	ifTrue: [ fstream := (working_dir/aFilePath) readStream. ^(STON fromString: (fstream contents)) loadNodes.]
	ifFalse: [ ^nil ].
	
]

{ #category : #'instance creation' }
CodeCaptionProject class >> newWithGitDir: aFilePath [
	"Constructor with gir directory"
	^ self new
		gitDirectory: aFilePath;
		yourself.
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
CodeCaptionProject >> loadNodes [
	codeCaptions
		do: [ :c | 
			c node: (Object readFrom: c node).
			c methodNode: (Object readFrom: c methodNode).
			"Call to setUp the nodes after reading from STON"
			c setUpFromSTON ]
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

{ #category : #'file in/out' }
CodeCaptionProject >> saveCodeCaptionProjectTo: aFilePath [
	| ston workingDir fstream |
	ston := STON toStringPretty: self.
	workingDir := FileSystem disk workingDirectory. (workingDir / aFilePath) ensureCreateFile.
	fstream := (workingDir / aFilePath) writeStream.
	fstream nextPutAll: ston.
	fstream close
]
