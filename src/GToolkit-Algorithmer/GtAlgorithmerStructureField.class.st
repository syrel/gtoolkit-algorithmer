Class {
	#name : #GtAlgorithmerStructureField,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'valueBlock'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #visiting }
GtAlgorithmerStructureField >> accept: aVisitor [
	^ aVisitor visitStructureField: self
]

{ #category : #initialization }
GtAlgorithmerStructureField >> initialize [
	super initialize.
	
	name := ''.
	type := GtAlgorithmerUnknownType new.
	valueBlock := nil
]

{ #category : #accessing }
GtAlgorithmerStructureField >> name [
	^ name
]

{ #category : #accessing }
GtAlgorithmerStructureField >> name: aFieldName [
	name := aFieldName asSymbol
]

{ #category : #accessing }
GtAlgorithmerStructureField >> type [
	^ type
]

{ #category : #accessing }
GtAlgorithmerStructureField >> type: anObject [
	type := anObject
]

{ #category : #generated }
GtAlgorithmerStructureField >> value: aValueBlock [
	valueBlock := aValueBlock
]

{ #category : #accessing }
GtAlgorithmerStructureField >> valueBlock [
	<return: #GtAlgorithmerBlock or: nil>

	^ valueBlock
]

{ #category : #accessing }
GtAlgorithmerStructureField >> valueOrDefaultBlock [
	<return: #GtAlgorithmerBlock or: nil>

	^ valueBlock ifNil: [ self type defaultValueBlock ]
]
