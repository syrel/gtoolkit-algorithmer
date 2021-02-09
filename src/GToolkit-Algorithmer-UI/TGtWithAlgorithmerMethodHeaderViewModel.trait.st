Trait {
	#name : #TGtWithAlgorithmerMethodHeaderViewModel,
	#instVars : [
		'algorithmerMethodHeaderViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #'api - algorithmer method header view model' }
TGtWithAlgorithmerMethodHeaderViewModel >> algorithmerMethodHeaderViewModel [
	"Return a not-null AlgorithmerMethodHeader view model assigned to the receiver element"
	self
		assert: [ algorithmerMethodHeaderViewModel notNil ]
		description: [ 'AlgorithmerMethodHeader view model should be initialized' ].

	^ algorithmerMethodHeaderViewModel
]

{ #category : #'api - algorithmer method header view model' }
TGtWithAlgorithmerMethodHeaderViewModel >> algorithmerMethodHeaderViewModel: aAlgorithmerMethodHeaderViewModel [
	"Set a not-null AlgorithmerMethodHeader view model assigned to the receiver element"
	self
		assert: [ aAlgorithmerMethodHeaderViewModel notNil ]
		description: [ 'AlgorithmerMethodHeader view model must not be nil' ].

	algorithmerMethodHeaderViewModel == aAlgorithmerMethodHeaderViewModel 
		ifTrue: [ ^ self ].

	algorithmerMethodHeaderViewModel ifNotNil: [ self unsubscribeFromAlgorithmerMethodHeaderViewModel ].
	algorithmerMethodHeaderViewModel := aAlgorithmerMethodHeaderViewModel.

	self onAlgorithmerMethodHeaderViewModelChanged.
	self subscribeToAlgorithmerMethodHeaderViewModel
]

{ #category : #'api - algorithmer method header view model' }
TGtWithAlgorithmerMethodHeaderViewModel >> hasAlgorithmerMethodHeaderViewModel [
	"Return a true if AlgorithmerMethodHeader view model is assigned to the receiver element, false otherwise"
	<return: #Boolean>

	^ algorithmerMethodHeaderViewModel notNil
]

{ #category : #'api - algorithmer method header view model' }
TGtWithAlgorithmerMethodHeaderViewModel >> onAlgorithmerMethodHeaderViewModelChanged [
	"Is sent when a new AlgorithmerMethodHeader view model is assigned to the element"
	
	self explicitRequirement
]

{ #category : #'api - algorithmer method header view model' }
TGtWithAlgorithmerMethodHeaderViewModel >> subscribeToAlgorithmerMethodHeaderViewModel [
	"Is sent after a new AlgorithmerMethodHeader view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerMethodHeaderViewModel if elements subscribe to them"
]

{ #category : #'api - algorithmer method header view model' }
TGtWithAlgorithmerMethodHeaderViewModel >> unsubscribeFromAlgorithmerMethodHeaderViewModel [
	"Is sent before a new AlgorithmerMethodHeader view model is assigned to the element.
	Elements that subscribe to AlgorithmerMethodHeader view model in domain model are required to implement this methods"
]
