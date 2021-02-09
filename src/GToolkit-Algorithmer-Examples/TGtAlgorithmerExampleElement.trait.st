Trait {
	#name : #TGtAlgorithmerExampleElement,
	#category : #'GToolkit-Algorithmer-Examples-Traits'
}

{ #category : #accessing }
TGtAlgorithmerExampleElement >> addChild: anElement [
	self children add: anElement
]

{ #category : #accessing }
TGtAlgorithmerExampleElement >> children [
	<return: #TGtAlgorithmerExampleChildren>

	^ self explicitRequirement
]

{ #category : #accessing }
TGtAlgorithmerExampleElement >> parent [
	<return: #TGtAlgorithmerExampleElement>
	
	^ self explicitRequirement
]
