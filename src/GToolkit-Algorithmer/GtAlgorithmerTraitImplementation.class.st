"
A trait implementation can ""override"" a trait's method
"
Class {
	#name : #GtAlgorithmerTraitImplementation,
	#superclass : #GtAlgorithmerImplementation,
	#instVars : [
		'trait'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #visiting }
GtAlgorithmerTraitImplementation >> accept: aVisitor [
	^ aVisitor visitTraitImplementation: self
]
