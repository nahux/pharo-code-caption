"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfCodeCaption,
	#superclass : #PackageManifest,
	#category : #'BaselineOfCodeCaption-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfCodeCaption class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#BaselineOfCodeCaption)) #'2021-01-29T18:28:31.121109-03:00') )
]

{ #category : #'code-critics' }
ManifestBaselineOfCodeCaption class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#BaselineOfCodeCaption #baseline: #false)) #'2021-01-28T20:53:27.730037-03:00') )
]

{ #category : #'code-critics' }
ManifestBaselineOfCodeCaption class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#BaselineOfCodeCaption #baseline: #false)) #'2021-01-29T18:28:31.072109-03:00') )
]
