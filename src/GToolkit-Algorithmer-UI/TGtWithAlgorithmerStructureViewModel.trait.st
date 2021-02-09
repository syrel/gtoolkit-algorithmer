Trait {
	#name : #TGtWithAlgorithmerStructureViewModel,
	#instVars : [
		'algorithmerStructureViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #'api - algorithmer structure view model' }
TGtWithAlgorithmerStructureViewModel >> algorithmerStructureViewModel [
	"Return a not-null AlgorithmerStructure view model assigned to the receiver element"
	self
		assert: [ algorithmerStructureViewModel notNil ]
		description: [ 'AlgorithmerStructure view model should be initialized' ].

	^ algorithmerStructureViewModel
]

{ #category : #'api - algorithmer structure view model' }
TGtWithAlgorithmerStructureViewModel >> algorithmerStructureViewModel: aAlgorithmerStructureViewModel [
	"Set a not-null AlgorithmerStructure view model assigned to the receiver element"
	self
		assert: [ aAlgorithmerStructureViewModel notNil ]
		description: [ 'AlgorithmerStructure view model must not be nil' ].

	algorithmerStructureViewModel == aAlgorithmerStructureViewModel 
		ifTrue: [ ^ self ].

	algorithmerStructureViewModel ifNotNil: [ self unsubscribeFromAlgorithmerStructureViewModel ].
	algorithmerStructureViewModel := aAlgorithmerStructureViewModel.

	self onAlgorithmerStructureViewModelChanged.
	self subscribeToAlgorithmerStructureViewModel
]

{ #category : #'api - algorithmer structure view model' }
TGtWithAlgorithmerStructureViewModel >> hasAlgorithmerStructureViewModel [
	"Return a true if AlgorithmerStructure view model is assigned to the receiver element, false otherwise"
	<return: #Boolean>

	^ algorithmerStructureViewModel notNil
]

{ #category : #'api - algorithmer structure view model' }
TGtWithAlgorithmerStructureViewModel >> onAlgorithmerStructureViewModelChanged [
	"Is sent when a new AlgorithmerStructure view model is assigned to the element"
	
	self explicitRequirement
]

{ #category : #'api - algorithmer structure view model' }
TGtWithAlgorithmerStructureViewModel >> subscribeToAlgorithmerStructureViewModel [
	"Is sent after a new AlgorithmerStructure view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerStructureViewModel if elements subscribe to them"
]

{ #category : #'api - algorithmer structure view model' }
TGtWithAlgorithmerStructureViewModel >> unsubscribeFromAlgorithmerStructureViewModel [
	"Is sent before a new AlgorithmerStructure view model is assigned to the element.
	Elements that subscribe to AlgorithmerStructure view model in domain model are required to implement this methods"
]
