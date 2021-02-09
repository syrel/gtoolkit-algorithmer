Class {
	#name : #GtAlgorithmerStructure,
	#superclass : #Object,
	#instVars : [
		'name',
		'fields'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #visiting }
GtAlgorithmerStructure >> accept: aVisitor [
	^ aVisitor visitStructure: self
]

{ #category : #accessing }
GtAlgorithmerStructure >> fields [
	^ fields
]

{ #category : #accessing }
GtAlgorithmerStructure >> fields: anObject [
	fields := anObject
]

{ #category : #initialization }
GtAlgorithmerStructure >> initialize [
	super initialize.
	
	fields := #()
]

{ #category : #accessing }
GtAlgorithmerStructure >> name [
	^ name
]

{ #category : #accessing }
GtAlgorithmerStructure >> name: aStructureName [
	name := aStructureName asSymbol
]
