Class {
	#name : #GtAlgorithmerAssignStructureFieldBlock,
	#superclass : #GtAlgorithmerCompositeBlock,
	#instVars : [
		'blocks',
		'name',
		'valueBlock'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerAssignStructureFieldBlock >> accept: aVisitor [
	^ aVisitor visitAssignStructureFieldBlock: self
]

{ #category : #'api - block' }
GtAlgorithmerAssignStructureFieldBlock >> blockName [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: name;
			space;
			nextPutAll: ':=';
			space;
			nextPutAll: valueBlock blockName ]
]

{ #category : #accessing }
GtAlgorithmerAssignStructureFieldBlock >> blocks [
	^ blocks
]

{ #category : #accessing }
GtAlgorithmerAssignStructureFieldBlock >> name [
	^ name
]

{ #category : #'instance creation' }
GtAlgorithmerAssignStructureFieldBlock >> name: aVariableName block: anAlgorithmerBlock [
	name := aVariableName.
	valueBlock := anAlgorithmerBlock.

	blocks := { 
		anAlgorithmerBlock.
		GtAlgorithmerWriteStructureFieldBlock new name: aVariableName.
	}
]

{ #category : #'instance creation' }
GtAlgorithmerAssignStructureFieldBlock >> name: aVariableName value: anObject [
	self
		name: aVariableName
		block: (GtAlgorithmerPushHeapBlock new object: anObject)
]

{ #category : #accessing }
GtAlgorithmerAssignStructureFieldBlock >> valueBlock [
	^ valueBlock
]
