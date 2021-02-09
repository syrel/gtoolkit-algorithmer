Class {
	#name : #GtAlgorithmerContext,
	#superclass : #Object,
	#instVars : [
		'object',
		'arguments'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #accessing }
GtAlgorithmerContext >> arguments [
	^ arguments
]

{ #category : #accessing }
GtAlgorithmerContext >> arguments: anObject [
	arguments := anObject
]

{ #category : #initialization }
GtAlgorithmerContext >> initialize [
	super initialize.
	
	arguments := #().
	object := nil
]

{ #category : #accessing }
GtAlgorithmerContext >> object [
	^ object
]

{ #category : #accessing }
GtAlgorithmerContext >> object: anObject [
	object := anObject
]

{ #category : #'api - context' }
GtAlgorithmerContext >> readArgumentNamed: anArgumentName [
	^ arguments at: anArgumentName
]

{ #category : #'api - context' }
GtAlgorithmerContext >> readStructureField: aFieldName [
	^ object instVarNamed: aFieldName
]

{ #category : #'api - context' }
GtAlgorithmerContext >> writeStructureField: aFieldName value: aValue [
	object instVarNamed: aFieldName put: aValue
]
