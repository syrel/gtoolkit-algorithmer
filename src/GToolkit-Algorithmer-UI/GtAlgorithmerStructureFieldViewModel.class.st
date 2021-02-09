Class {
	#name : #GtAlgorithmerStructureFieldViewModel,
	#superclass : #Object,
	#instVars : [
		'structureField',
		'valueBlockViewModel'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #'api - view model' }
GtAlgorithmerStructureFieldViewModel >> fieldName [
	^ self structureField name
]

{ #category : #accessing }
GtAlgorithmerStructureFieldViewModel >> fieldType [
	<return: #GtAlgorithmerType>

	^ self structureField type
]

{ #category : #'api - view model' }
GtAlgorithmerStructureFieldViewModel >> hasValidType [
	^ self structureField type isVoid not and: [ self structureField type isUnknown not ]
]

{ #category : #accessing }
GtAlgorithmerStructureFieldViewModel >> structureField [
	^ structureField
]

{ #category : #accessing }
GtAlgorithmerStructureFieldViewModel >> structureField: aStructureField [
	structureField := aStructureField.
	structureField valueBlock ifNotNil: [ :aValueBlock |
		valueBlockViewModel := aValueBlock asAlgorithmerBlockViewModel ]
]

{ #category : #'api - view model' }
GtAlgorithmerStructureFieldViewModel >> typeName [
	^ self structureField type accept: GtAlgorithmerFieldTypePrinter new
]

{ #category : #accessing }
GtAlgorithmerStructureFieldViewModel >> valueBlockViewModel [
	^ valueBlockViewModel
]

{ #category : #'api - view model' }
GtAlgorithmerStructureFieldViewModel >> valueDisplayLabel [
	^ self valueBlockViewModel
		ifNil: [ self fieldType defaultValueBlock
			ifNil: [ 'None' ]
			ifNotNil: [ :anAlgorithmerBlock | anAlgorithmerBlock accept: GtAlgorithmerFieldValuePrinter new ] ]
		ifNotNil: [ :aBlockViewModel | aBlockViewModel block accept: GtAlgorithmerFieldValuePrinter new ]
]

{ #category : #'api - view model' }
GtAlgorithmerStructureFieldViewModel >> valueName [
	^ self valueBlockViewModel
		ifNil: [ 'None' ]
		ifNotNil: [ :aBlockViewModel | aBlockViewModel block accept: GtAlgorithmerFieldValuePrinter new ]
]
