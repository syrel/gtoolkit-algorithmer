Class {
	#name : #GtAlgorithmerStructureField,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'defaultValueBlock'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #visiting }
GtAlgorithmerStructureField >> accept: aVisitor [
	^ aVisitor visitStructureField: self
]

{ #category : #accessing }
GtAlgorithmerStructureField >> defaultValueBlock [
	^ defaultValueBlock
]

{ #category : #accessing }
GtAlgorithmerStructureField >> defaultValueBlock: anObject [
	defaultValueBlock := anObject
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
	defaultValueBlock := aValueBlock
]
