Class {
	#name : #GtAlgorithmerBooleanType,
	#superclass : #GtAlgorithmerType,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerBooleanType >> accept: aVisitor [
	^ aVisitor visitBooleanType: self
]
