Class {
	#name : #GtAlgorithmerMethod,
	#superclass : #Object,
	#instVars : [
		'name',
		'body',
		'returnType'
	],
	#category : #'GToolkit-Algorithmer-Composition'
}

{ #category : #visiting }
GtAlgorithmerMethod >> accept: aVisitor [
	^ aVisitor visitTraitMethod: self
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

	returnType := GtAlgorithmerVoidType new
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
