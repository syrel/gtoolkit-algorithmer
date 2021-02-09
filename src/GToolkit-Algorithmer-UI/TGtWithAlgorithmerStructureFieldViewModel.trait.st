Trait {
	#name : #TGtWithAlgorithmerStructureFieldViewModel,
	#instVars : [
		'algorithmerStructureFieldViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #'api - algorithmer structure field view model' }
TGtWithAlgorithmerStructureFieldViewModel >> algorithmerStructureFieldViewModel [
	"Return a not-null AlgorithmerStructureField view model assigned to the receiver element"
	self
		assert: [ algorithmerStructureFieldViewModel notNil ]
		description: [ 'AlgorithmerStructureField view model should be initialized' ].

	^ algorithmerStructureFieldViewModel
]

{ #category : #'api - algorithmer structure field view model' }
TGtWithAlgorithmerStructureFieldViewModel >> algorithmerStructureFieldViewModel: aAlgorithmerStructureFieldViewModel [
	"Set a not-null AlgorithmerStructureField view model assigned to the receiver element"
	self
		assert: [ aAlgorithmerStructureFieldViewModel notNil ]
		description: [ 'AlgorithmerStructureField view model must not be nil' ].

	algorithmerStructureFieldViewModel == aAlgorithmerStructureFieldViewModel 
		ifTrue: [ ^ self ].

	algorithmerStructureFieldViewModel ifNotNil: [ self unsubscribeFromAlgorithmerStructureFieldViewModel ].
	algorithmerStructureFieldViewModel := aAlgorithmerStructureFieldViewModel.

	self onAlgorithmerStructureFieldViewModelChanged.
	self subscribeToAlgorithmerStructureFieldViewModel
]

{ #category : #'api - algorithmer structure field view model' }
TGtWithAlgorithmerStructureFieldViewModel >> hasAlgorithmerStructureFieldViewModel [
	"Return a true if AlgorithmerStructureField view model is assigned to the receiver element, false otherwise"
	<return: #Boolean>

	^ algorithmerStructureFieldViewModel notNil
]

{ #category : #'api - algorithmer structure field view model' }
TGtWithAlgorithmerStructureFieldViewModel >> onAlgorithmerStructureFieldViewModelChanged [
	"Is sent when a new AlgorithmerStructureField view model is assigned to the element"
	
	self explicitRequirement
]

{ #category : #'api - algorithmer structure field view model' }
TGtWithAlgorithmerStructureFieldViewModel >> subscribeToAlgorithmerStructureFieldViewModel [
	"Is sent after a new AlgorithmerStructureField view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerStructureFieldViewModel if elements subscribe to them"
]

{ #category : #'api - algorithmer structure field view model' }
TGtWithAlgorithmerStructureFieldViewModel >> unsubscribeFromAlgorithmerStructureFieldViewModel [
	"Is sent before a new AlgorithmerStructureField view model is assigned to the element.
	Elements that subscribe to AlgorithmerStructureField view model in domain model are required to implement this methods"
]
