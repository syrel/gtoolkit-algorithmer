Class {
	#name : #GtAlgorithmerBooleanType,
	#superclass : #GtAlgorithmerType,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerBooleanType >> accept: aVisitor [
	^ aVisitor visitBooleanType: self
]

{ #category : #accessing }
GtAlgorithmerBooleanType >> defaultValueBlock [
	"Return a Block to create a default value"

	^ GtAlgorithmerPushHeapBlock new object: false
]
