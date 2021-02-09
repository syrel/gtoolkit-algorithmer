Class {
	#name : #GtAlgorithmerUnknownType,
	#superclass : #GtAlgorithmerType,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerUnknownType >> accept: aVisitor [
	^ aVisitor visitUnknownType: self
]

{ #category : #testing }
GtAlgorithmerUnknownType >> isUnknown [
	^ true
]
