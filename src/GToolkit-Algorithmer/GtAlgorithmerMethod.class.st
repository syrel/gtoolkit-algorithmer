Class {
	#name : #GtAlgorithmerMethod,
	#superclass : #Object,
	#instVars : [
		'name',
		'body',
		'returnType',
		'arguments',
		'isFromTrait'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #visiting }
GtAlgorithmerMethod >> accept: aVisitor [
	^ aVisitor visitMethod: self
]

{ #category : #accessing }
GtAlgorithmerMethod >> arguments [
	^ arguments
]

{ #category : #accessing }
GtAlgorithmerMethod >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
GtAlgorithmerMethod >> body [
	<return: #GtAlgorithmerBlock>

	^ body
]

{ #category : #accessing }
GtAlgorithmerMethod >> body: anObject [
	body := anObject
]

{ #category : #testing }
GtAlgorithmerMethod >> hasReturn [
	^ returnType isVoid not
]

{ #category : #initialization }
GtAlgorithmerMethod >> initialize [
	super initialize.

	returnType := GtAlgorithmerVoidType new.
	arguments := #().
	isFromTrait := false
]

{ #category : #accessing }
GtAlgorithmerMethod >> isFromTrait [
	^ isFromTrait
]

{ #category : #accessing }
GtAlgorithmerMethod >> isFromTrait: anObject [
	isFromTrait := anObject
]

{ #category : #accessing }
GtAlgorithmerMethod >> name [
	<return: #Symbol>

	^ name
]

{ #category : #accessing }
GtAlgorithmerMethod >> name: aMethodName [
	name := aMethodName asSymbol
]

{ #category : #accessing }
GtAlgorithmerMethod >> returnType [
	^ returnType
]

{ #category : #accessing }
GtAlgorithmerMethod >> returnType: aReturnType [
	returnType := aReturnType
]
