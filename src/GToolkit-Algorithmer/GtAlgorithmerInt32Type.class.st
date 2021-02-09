Class {
	#name : #GtAlgorithmerInt32Type,
	#superclass : #GtAlgorithmerType,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerInt32Type >> accept: aVisitor [
	^ aVisitor visitInt32Type: self
]

{ #category : #accessing }
GtAlgorithmerInt32Type >> defaultValueBlock [
	"Return a Block to create a default value"

	^ GtAlgorithmerPushHeapBlock new object: 0
]
