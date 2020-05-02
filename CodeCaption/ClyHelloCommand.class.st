"
Say hello contextmenu.
"
Class {
	#name : #ClyHelloCommand,
	#superclass : #CmdCommand,
	#category : #'CodeCaption-UI Context'
}

{ #category : #activation }
ClyHelloCommand class >> sourceCodeMenuActivation [
	<classAnnotation>
	
	^SycSourceCodeMenuActivation byRootGroupItemOrder: 100000 for: ClyMethodSourceCodeContext
]

{ #category : #accessing }
ClyHelloCommand >> defaultMenuItemName [
	^'Say Hello'.
]

{ #category : #accessing }
ClyHelloCommand >> execute [
	self inform: 'Hello' 
]
