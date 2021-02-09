Class {
	#name : #GtAlgorithmerClassType,
	#superclass : #GtAlgorithmerType,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerClassType >> accept: aVisitor [
	^ aVisitor visitClassType: self
]

{ #category : #accessing }
GtAlgorithmerClassType >> name [
	^ name
]

{ #category : #accessing }
GtAlgorithmerClassType >> name: anObject [
	name := anObject
]
