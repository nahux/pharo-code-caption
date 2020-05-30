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
	codeCaptions := (STON fromString: (fstream contents)).
	fstream close.
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
CodeCaptionProject >> saveCaptionsTo: aFilePath [
	| ston workingDir fstream |
	ston := STON toStringPretty: self codeCaptions.
	workingDir := FileSystem disk workingDirectory.
	fstream := (workingDir / aFilePath) writeStream.
	fstream nextPutAll: ston.
	fstream close
]
