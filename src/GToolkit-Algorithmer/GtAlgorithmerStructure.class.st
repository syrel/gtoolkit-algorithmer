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

{ #category : #'api - fields' }
GtAlgorithmerStructure >> addField: aGtAlgorithmerStructureField [
	fields add: aGtAlgorithmerStructureField
]

{ #category : #'api - fields' }
GtAlgorithmerStructure >> addFieldName: aName [
	self addField: (GtAlgorithmerStructureField new
		name: aName)
]

{ #category : #'api - fields' }
GtAlgorithmerStructure >> addFieldName: aName type: aType [
	self addField: (GtAlgorithmerStructureField new
		name: aName;
		type: aType)
]

{ #category : #'api - fields' }
GtAlgorithmerStructure >> addFieldName: aName type: aType value: aDefaultValueBlock [
	self addField: (GtAlgorithmerStructureField new
		name: aName;
		type: aType;
		value: aDefaultValueBlock)
]

{ #category : #accessing }
GtAlgorithmerStructure >> fields [
	^ fields
]

{ #category : #'api - fields' }
GtAlgorithmerStructure >> fields: anObject [
	fields := anObject asOrderedCollection
]

{ #category : #testing }
GtAlgorithmerStructure >> hasFields [
	^ fields isNotEmpty
]

{ #category : #initialization }
GtAlgorithmerStructure >> initialize [
	super initialize.
	
	fields := OrderedCollection new
]

{ #category : #accessing }
GtAlgorithmerStructure >> name [
	^ name
]

{ #category : #accessing }
GtAlgorithmerStructure >> name: aStructureName [
	name := aStructureName asSymbol
]
