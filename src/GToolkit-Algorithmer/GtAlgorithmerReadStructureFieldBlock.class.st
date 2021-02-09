Class {
	#name : #GtAlgorithmerReadStructureFieldBlock,
	#superclass : #GtAlgorithmerVariableBlock,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerReadStructureFieldBlock >> accept: aVisitor [
	^ aVisitor visitReadStructureFieldBlock: self
]
