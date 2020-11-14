Extension { #name : #IceLibgitRepository }

{ #category : #'*CodeCaption' }
IceLibgitRepository >> stonOn: stonWriter [
	"Print the dump when STON"
	stonWriter writeString: (self name)
]
