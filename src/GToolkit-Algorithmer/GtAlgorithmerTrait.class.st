Class {
	#name : #GtAlgorithmerTrait,
	#superclass : #Object,
	#instVars : [
		'name',
		'methods'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #visiting }
GtAlgorithmerTrait >> accept: aVisitor [
	^ aVisitor visitTrait: self
]

{ #category : #initialization }
GtAlgorithmerTrait >> initialize [
	super initialize.
	
	methods := #()
]

{ #category : #accessing }
GtAlgorithmerTrait >> methods [
	^ methods
]

{ #category : #accessing }
GtAlgorithmerTrait >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
GtAlgorithmerTrait >> name [
	^ name
]

{ #category : #accessing }
GtAlgorithmerTrait >> name: anObject [
	name := anObject
]
