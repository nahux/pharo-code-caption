"
Baseline of CodeCaption
"
Class {
	#name : #BaselineOfCodeCaption,
	#superclass : #BaselineOf,
	#category : #'BaselineOfCodeCaption-baseline'
}

{ #category : #baselines }
BaselineOfCodeCaption >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OSSubprocess'
				with:
					[ spec repository: 'github://pharo-contributions/OSSubprocess' ].
			spec package: 'CodeCaption' ]
]
