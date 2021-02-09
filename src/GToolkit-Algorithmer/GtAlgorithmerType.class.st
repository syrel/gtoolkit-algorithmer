Class {
	#name : #GtAlgorithmerType,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerType >> accept: aVisitor [
	^ self subclassResponsibility
]

{ #category : #testing }
GtAlgorithmerType >> isVoid [
	^ false
]
