Class {
	#name : #GtAlgorithmerCanvasExamples,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Examples-UI'
}

{ #category : #examples }
GtAlgorithmerCanvasExamples >> canvasWithOneClass [
	<gtExample>
	 | aCanvas |
	
	aCanvas := self emptyCanvas.
	aCanvas addClass: GtAlgorithmerClassExamples new classWithStructureAndImplementation.
	
	^ aCanvas
]

{ #category : #examples }
GtAlgorithmerCanvasExamples >> canvasWithOneStructure [
	<gtExample>
	 | aCanvas |
	
	aCanvas := self emptyCanvas.
	aCanvas addStructure: GtAlgorithmerStructureExamples new structureAddFieldNameWithFloatType.
	
	^ aCanvas
]

{ #category : #examples }
GtAlgorithmerCanvasExamples >> emptyCanvas [
	<gtExample>

	^ GtAlgorithmerCanvas new
]
