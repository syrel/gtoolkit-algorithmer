"
A class in algorithmer consists of the structure (memory layout) and implementations
"
Class {
	#name : #GtAlgorithmerClass,
	#superclass : #Object,
	#instVars : [
		'structure',
		'implementations'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #visiting }
GtAlgorithmerClass >> accept: aVisitor [
	^ aVisitor visitClass: self
]

{ #category : #accessing }
GtAlgorithmerClass >> implementations [
	^ implementations
]

{ #category : #accessing }
GtAlgorithmerClass >> implementations: anObject [
	implementations := anObject.
	implementations do: [ :each | each algorithmerClass: self ]
]

{ #category : #accessing }
GtAlgorithmerClass >> name [
	^ self structure name
]

{ #category : #accessing }
GtAlgorithmerClass >> structure [
	^ structure
]

{ #category : #accessing }
GtAlgorithmerClass >> structure: anObject [
	structure := anObject
]
