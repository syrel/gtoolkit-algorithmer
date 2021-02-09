Class {
	#name : #GtAlgorithmerClassExamples,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Examples-Composition'
}

{ #category : #examples }
GtAlgorithmerClassExamples >> classWithStructureAndImplementation [
	<gtExample>
	| aClass |
	
	aClass := GtAlgorithmerClass new
		structure: (GtAlgorithmerStructureExamples new structureAddFieldNameWithFloatType);
		implementations: { 
			GtAlgorithmerClassImplementationExamples new classImplementationWithSimpleMethods
		}.
		
	^ aClass
]
