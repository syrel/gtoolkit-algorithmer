Class {
	#name : #GtAlgorithmerVoidType,
	#superclass : #GtAlgorithmerType,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerVoidType >> accept: aVisitor [
	^ aVisitor visitVoidType: self
]

{ #category : #testing }
GtAlgorithmerVoidType >> isVoid [
	^ true
]
