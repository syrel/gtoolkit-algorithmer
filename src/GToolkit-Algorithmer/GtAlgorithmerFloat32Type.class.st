Class {
	#name : #GtAlgorithmerFloat32Type,
	#superclass : #GtAlgorithmerType,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerFloat32Type >> accept: aVisitor [
	^ aVisitor visitFloat32Type: self
]

{ #category : #accessing }
GtAlgorithmerFloat32Type >> defaultValueBlock [
	"Return a Block to create a default value"

	^ GtAlgorithmerPushHeapBlock new object: 0.0
]
