Class {
	#name : #GtAlgorithmerReturnTypePrinter,
	#superclass : #Object,
	#traits : 'TGtAlgorithmerTypeVisitor',
	#classTraits : 'TGtAlgorithmerTypeVisitor classTrait',
	#category : #'GToolkit-Algorithmer-UI-Helpers'
}

{ #category : #'visiting - types' }
GtAlgorithmerReturnTypePrinter >> visitBooleanType: aBooleanType [
	^ 'bool'
]

{ #category : #'visiting - types' }
GtAlgorithmerReturnTypePrinter >> visitClassType: aClassType [
	^ aClassType name
]

{ #category : #'visiting - types' }
GtAlgorithmerReturnTypePrinter >> visitFloat32Type: aFloat32Type [
	^ 'float32'
]

{ #category : #'visiting - types' }
GtAlgorithmerReturnTypePrinter >> visitInt32Type: anInt32Type [
	^ 'int32'
]

{ #category : #'visiting - types' }
GtAlgorithmerReturnTypePrinter >> visitTraitType: aTraitType [
	^ aTraitType name
]

{ #category : #'visiting - types' }
GtAlgorithmerReturnTypePrinter >> visitUnknownType: anUnknownType [
	^ 'unknown'
]

{ #category : #'visiting - types' }
GtAlgorithmerReturnTypePrinter >> visitVoidType: aVoidType [
	^ 'void'
]
