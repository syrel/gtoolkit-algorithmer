Class {
	#name : #GtAlgorithmerMethodArgument,
	#superclass : #Object,
	#instVars : [
		'name',
		'type'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #initialization }
GtAlgorithmerMethodArgument >> initialize [
	super initialize.
	
	type := GtAlgorithmerUnknownType new
]

{ #category : #accessing }
GtAlgorithmerMethodArgument >> name [
	^ name
]

{ #category : #accessing }
GtAlgorithmerMethodArgument >> name: anObject [
	name := anObject asSymbol
]

{ #category : #accessing }
GtAlgorithmerMethodArgument >> type [
	^ type
]

{ #category : #accessing }
GtAlgorithmerMethodArgument >> type: anObject [
	type := anObject
]
