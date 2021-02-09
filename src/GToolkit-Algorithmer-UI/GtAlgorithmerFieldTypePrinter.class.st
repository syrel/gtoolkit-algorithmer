Class {
	#name : #GtAlgorithmerFieldTypePrinter,
	#superclass : #Object,
	#traits : 'TGtAlgorithmerTypeVisitor',
	#classTraits : 'TGtAlgorithmerTypeVisitor classTrait',
	#category : #'GToolkit-Algorithmer-UI-Helpers'
}

{ #category : #'visiting - types' }
GtAlgorithmerFieldTypePrinter >> visitBooleanType: aBooleanType [
	^ 'bool'
]

{ #category : #'visiting - types' }
GtAlgorithmerFieldTypePrinter >> visitClassType: aClassType [
	^ aClassType name
]

{ #category : #'visiting - types' }
GtAlgorithmerFieldTypePrinter >> visitFloat32Type: aFloat32Type [
	^ 'float32'
]

{ #category : #'visiting - types' }
GtAlgorithmerFieldTypePrinter >> visitInt32Type: anInt32Type [
	^ 'int32'
]

{ #category : #'visiting - types' }
GtAlgorithmerFieldTypePrinter >> visitTraitType: aTraitType [
	^ aTraitType name
]

{ #category : #'visiting - types' }
GtAlgorithmerFieldTypePrinter >> visitUnknownType: anUnknownType [
	^ 'unknown'
]

{ #category : #'visiting - types' }
GtAlgorithmerFieldTypePrinter >> visitVoidType: aVoidType [
	^ 'void'
]
