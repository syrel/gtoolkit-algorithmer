Class {
	#name : #GtAlgorithmerType,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerType >> accept: aVisitor [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtAlgorithmerType >> defaultValueBlock [
	"Return a Block to create a default value"

	^ nil
]

{ #category : #testing }
GtAlgorithmerType >> isUnknown [
	^ false
]

{ #category : #testing }
GtAlgorithmerType >> isVoid [
	^ false
]
