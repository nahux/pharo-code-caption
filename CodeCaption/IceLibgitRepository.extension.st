Extension { #name : #IceLibgitRepository }

{ #category : #'*CodeCaption' }
IceLibgitRepository >> stonOn: stonWriter [
	stonWriter writeString: self asString.
]
