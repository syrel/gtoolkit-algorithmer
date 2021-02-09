Class {
	#name : #GtAlgorithmerClassImplementationExamples,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Examples-Composition'
}

{ #category : #examples }
GtAlgorithmerClassImplementationExamples >> classImplementationWithSimpleMethods [
	<gtExample>
	| anImplementation |
	
	anImplementation := GtAlgorithmerClassImplementation new.
	anImplementation label: 'accessors'.
	anImplementation methods: { 
		GtAlgorithmerMethodExamples new return42.
		GtAlgorithmerMethodExamples new returnLargeInteger.
		GtAlgorithmerMethodExamples new returnPi
	}.
	
	^ anImplementation
]
