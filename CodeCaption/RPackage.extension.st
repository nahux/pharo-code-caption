Extension { #name : #RPackage }

{ #category : #'*CodeCaption' }
RPackage >> packageCodeCaption: className [
	^ self definedClasses 
		detect: [ :each | (each name = className) ] ifNone: [ ^nil ]
]
