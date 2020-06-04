Extension { #name : #RBProgramNode }

{ #category : #'*CodeCaption' }
RBProgramNode >> stonOn: stonWriter [
	"Print the dump when STON"
	stonWriter writeString: (self dump)
]
