Class {
	#name : #GtAlgorithmerReadMethodArgumentBlock,
	#superclass : #GtAlgorithmerVariableBlock,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerReadMethodArgumentBlock >> accept: aVisitor [
	^ aVisitor visitReadMethodArgumentBlock: self
]
