"
Comments for a project
"
Class {
	#name : #CodeCaptionProject,
	#superclass : #Object,
	#instVars : [
		'codeCaptions',
		'package',
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
CodeCaptionProject >> addCodeCaption:aComment [
	codeCaptions add: aComment
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
	codeCaptions:= OrderedCollection new.
]

{ #category : #'file in/out' }
CodeCaptionProject >> loadCaptions: aFilePath [
	| working_dir fstream |
	working_dir := FileSystem disk workingDirectory.
	fstream := (working_dir/aFilePath) readStream.
	codeCaptions := (STON fromSton: (fstream contents)).
	fstream close.
]

{ #category : #'as yet unclassified' }
CodeCaptionProject >> loadNodes [
	codeCaptions do: [ :c | c node: (Object readFrom: c node) ]
]

{ #category : #accessing }
CodeCaptionProject >> package [
	^ package
]

{ #category : #accessing }
CodeCaptionProject >> package: anObject [
	package := anObject
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
