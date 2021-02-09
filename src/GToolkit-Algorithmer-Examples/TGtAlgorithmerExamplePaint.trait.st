Trait {
	#name : #TGtAlgorithmerExamplePaint,
	#category : #'GToolkit-Algorithmer-Examples-Traits'
}

{ #category : #testing }
TGtAlgorithmerExamplePaint >> isOpaque [
	"Return true if I am opaque, false otherwise.
	It is important to implement paint specific logic in subclasses.
	If paint is opeque we don't have to render elements behind it"
	<return: #Boolean>

	^ false
]

{ #category : #testing }
TGtAlgorithmerExamplePaint >> isTransparent [
	"Return true if I am transparent, false otherwise.
	It is important to implement paint specific logic in subclasses.
	If paint is transparent there is no need to render anything that uses it"
	<return: #Boolean>

	^ false
]

{ #category : #testing }
TGtAlgorithmerExamplePaint >> matchExtent: anExtent [
	self explicitRequirement
]
