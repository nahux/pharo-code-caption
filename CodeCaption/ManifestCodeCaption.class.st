"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCodeCaption,
	#superclass : #PackageManifest,
	#category : #'CodeCaption-Manifest'
}

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleCascadedNextPutAllsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CodeCaptionProject #saveCodeCaptionProjectTo:withText:andAuthor: #false)) #'2021-11-09T20:23:43.314152-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CodeCaptionProject #saveCodeCaptionProjectTo:withText:andAuthor: #false)) #'2021-11-09T20:24:02.131652-03:00') #(#(#RGMethodDefinition #(#CodeCaptionProject #saveCodeCaptionProjectTo:withText:andAuthor: #false)) #'2021-11-09T20:24:07.105812-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleGRIvarNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#CodeCaptionApplication)) #'2020-05-30T19:02:54.006273-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBClassNameInSelectorRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'CodeCaptionProject class' #loadCodeCaptionProject: #true)) #'2020-06-04T20:23:54.601351-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#CodeCaption)) #'2020-04-18T15:06:37.170197-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBContainsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'CodeCaptionProject class' #getRepositoryForPackageName: #true)) #'2021-06-21T17:33:28.258074-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBGlobalVariablesUsageV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'ClyCodeCaptionCommand class' #canBeExecutedInContext: #true)) #'2020-05-16T16:16:53.92994-03:00') #(#(#RGClassDefinition #(#CodeCaptionProject)) #'2021-04-25T13:30:22.087627-03:00') #(#(#RGMethodDefinition #(#CodeCaptionListWindow #syncCodeCaptionProject #false)) #'2021-06-24T20:54:10.447632-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CodeCaptionVisitor #visitSourceCode: #false)) #'2020-04-26T19:18:33.010248-03:00') #(#(#RGMethodDefinition #(#CodeCaptionProject #loadCaptions: #false)) #'2020-12-01T19:44:22.374054-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#CodeCaption)) #'2020-04-18T15:07:36.474197-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GrandPrixTest #setUp #false)) #'2020-11-23T16:08:19.646192-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GrandPrix #race #false)) #'2020-11-23T15:50:57.001192-03:00') )
]

{ #category : #'code-critics' }
ManifestCodeCaption class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CodeCaptionWindow #initializeWindow: #false)) #'2020-05-09T15:44:18.152475-03:00') #(#(#RGMethodDefinition #(#CodeCaptionProject #method:hasNode: #false)) #'2021-01-08T19:34:23.403586-03:00') )
]
