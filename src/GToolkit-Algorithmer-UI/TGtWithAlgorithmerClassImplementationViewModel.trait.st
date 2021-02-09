Trait {
	#name : #TGtWithAlgorithmerClassImplementationViewModel,
	#instVars : [
		'algorithmerClassImplementationViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #'api - algorithmer class implementation view model' }
TGtWithAlgorithmerClassImplementationViewModel >> algorithmerClassImplementationViewModel [
	"Return a not-null AlgorithmerClassImplementation view model assigned to the receiver element"
	self
		assert: [ algorithmerClassImplementationViewModel notNil ]
		description: [ 'AlgorithmerClassImplementation view model should be initialized' ].

	^ algorithmerClassImplementationViewModel
]

{ #category : #'api - algorithmer class implementation view model' }
TGtWithAlgorithmerClassImplementationViewModel >> algorithmerClassImplementationViewModel: aAlgorithmerClassImplementationViewModel [
	"Set a not-null AlgorithmerClassImplementation view model assigned to the receiver element"
	self
		assert: [ aAlgorithmerClassImplementationViewModel notNil ]
		description: [ 'AlgorithmerClassImplementation view model must not be nil' ].

	algorithmerClassImplementationViewModel == aAlgorithmerClassImplementationViewModel 
		ifTrue: [ ^ self ].

	algorithmerClassImplementationViewModel ifNotNil: [ self unsubscribeFromAlgorithmerClassImplementationViewModel ].
	algorithmerClassImplementationViewModel := aAlgorithmerClassImplementationViewModel.

	self onAlgorithmerClassImplementationViewModelChanged.
	self subscribeToAlgorithmerClassImplementationViewModel
]

{ #category : #'api - algorithmer class implementation view model' }
TGtWithAlgorithmerClassImplementationViewModel >> hasAlgorithmerClassImplementationViewModel [
	"Return a true if AlgorithmerClassImplementation view model is assigned to the receiver element, false otherwise"
	<return: #Boolean>

	^ algorithmerClassImplementationViewModel notNil
]

{ #category : #'api - algorithmer class implementation view model' }
TGtWithAlgorithmerClassImplementationViewModel >> onAlgorithmerClassImplementationViewModelChanged [
	"Is sent when a new AlgorithmerClassImplementation view model is assigned to the element"
	
	self explicitRequirement
]

{ #category : #'api - algorithmer class implementation view model' }
TGtWithAlgorithmerClassImplementationViewModel >> subscribeToAlgorithmerClassImplementationViewModel [
	"Is sent after a new AlgorithmerClassImplementation view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerClassImplementationViewModel if elements subscribe to them"
]

{ #category : #'api - algorithmer class implementation view model' }
TGtWithAlgorithmerClassImplementationViewModel >> unsubscribeFromAlgorithmerClassImplementationViewModel [
	"Is sent before a new AlgorithmerClassImplementation view model is assigned to the element.
	Elements that subscribe to AlgorithmerClassImplementation view model in domain model are required to implement this methods"
]
