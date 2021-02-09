Class {
	#name : #GtAlgorithmerStructureViewModel,
	#superclass : #Object,
	#instVars : [
		'structure',
		'structureFieldViewModels'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #accessing }
GtAlgorithmerStructureViewModel >> rustSourceCode [
	^ self structure accept: (GtAlgorithmerRustExporter new)
]

{ #category : #accessing }
GtAlgorithmerStructureViewModel >> structure [
	^ structure
]

{ #category : #accessing }
GtAlgorithmerStructureViewModel >> structure: anObject [
	structure := anObject.
	
	structureFieldViewModels := structure fields collect: [ :eachField |
		GtAlgorithmerStructureFieldViewModel new
			structureField: eachField;
			yourself ]
]

{ #category : #accessing }
GtAlgorithmerStructureViewModel >> structureFieldViewModels [
	^ structureFieldViewModels
]

{ #category : #testing }
GtAlgorithmerStructureViewModel >> structureName [
	^ structure name
]
