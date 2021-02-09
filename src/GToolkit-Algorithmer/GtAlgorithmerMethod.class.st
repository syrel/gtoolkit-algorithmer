Class {
	#name : #GtAlgorithmerMethod,
	#superclass : #Object,
	#instVars : [
		'name',
		'return',
		'body'
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
	^ return isVoid not
]

{ #category : #initialization }
GtAlgorithmerMethod >> initialize [
	super initialize.

	return := GtAlgorithmerVoidType new
]

{ #category : #accessing }
GtAlgorithmerMethod >> name [
	<return: #Symbol>

	^ name
]

{ #category : #accessing }
GtAlgorithmerMethod >> name: anObject [
	name := anObject
]

{ #category : #accessing }
GtAlgorithmerMethod >> return [
	^ return
]

{ #category : #accessing }
GtAlgorithmerMethod >> return: anObject [
	return := anObject
]
