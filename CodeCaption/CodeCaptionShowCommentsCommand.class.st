"
I am a copy of class SycCopyMethodNameToClypboardCommand. This comment is copied from there, and might not be entirely accurate

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CodeCaptionShowCommentsCommand,
	#superclass : #SycMethodCommand,
	#category : #'CodeCaption-UI Context'
}

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
	CodeCaptionComment allInstances last inspect.
]
