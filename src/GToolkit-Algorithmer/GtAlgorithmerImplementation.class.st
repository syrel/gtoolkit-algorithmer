Class {
	#name : #GtAlgorithmerImplementation,
	#superclass : #Object,
	#instVars : [
		'methods',
		'algorithmerClass'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #accessing }
GtAlgorithmerImplementation >> algorithmerClass [
	^ algorithmerClass
]

{ #category : #accessing }
GtAlgorithmerImplementation >> algorithmerClass: anObject [
	algorithmerClass := anObject
]

{ #category : #accessing }
GtAlgorithmerImplementation >> methods [
	^ methods
]

{ #category : #accessing }
GtAlgorithmerImplementation >> methods: anObject [
	methods := anObject
]
