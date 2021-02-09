Class {
	#name : #GtAlgorithmerClassImplementation,
	#superclass : #GtAlgorithmerImplementation,
	#instVars : [
		'label'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #visiting }
GtAlgorithmerClassImplementation >> accept: aVisitor [
	^ aVisitor visitClassImplementation: self
]

{ #category : #accessing }
GtAlgorithmerClassImplementation >> label [
	^ label
]

{ #category : #accessing }
GtAlgorithmerClassImplementation >> label: anObject [
	label := anObject
]
