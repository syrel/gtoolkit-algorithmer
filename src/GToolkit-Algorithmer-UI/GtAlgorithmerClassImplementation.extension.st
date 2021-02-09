Extension { #name : #GtAlgorithmerClassImplementation }

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerClassImplementation >> asAlgorithmerImplementationViewModel [
	^ GtAlgorithmerClassImplementationViewModel new implementation: self
]

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerClassImplementation >> gtLiveFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Live';
		priority: 5;
		stencil: [ 
			| aViewModel aElement |
			
			aViewModel := GtAlgorithmerClassImplementationViewModel new
				implementation: self.
				
			aElement := GtAlgorithmerClassImplementationElement new
				algorithmerClassImplementationViewModel: aViewModel.
			
			aElement ]
]
