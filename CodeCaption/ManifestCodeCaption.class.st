"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCodeCaption,
	#superclass : #PackageManifest,
	#category : #'CodeCaption-Manifest'
}

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#CodeCaption)) #'2020-04-18T15:06:37.170197-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CodeCaptionVisitor #visitSourceCode: #false)) #'2020-04-26T19:18:33.010248-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#CodeCaption)) #'2020-04-18T15:07:36.474197-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CodeCaptionWindow #initializeWindow: #false)) #'2020-05-09T15:44:18.152475-03:00') )
]
