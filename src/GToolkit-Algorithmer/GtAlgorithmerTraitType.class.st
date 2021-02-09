Class {
	#name : #GtAlgorithmerTraitType,
	#superclass : #GtAlgorithmerType,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerTraitType >> accept: aVisitor [
	^ aVisitor visitTraitType: self
]

{ #category : #accessing }
GtAlgorithmerTraitType >> name [
	^ name
]

{ #category : #accessing }
GtAlgorithmerTraitType >> name: anObject [
	name := anObject
]
