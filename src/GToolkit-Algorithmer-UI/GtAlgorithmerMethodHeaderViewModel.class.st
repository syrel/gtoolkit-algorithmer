Class {
	#name : #GtAlgorithmerMethodHeaderViewModel,
	#superclass : #Object,
	#instVars : [
		'method'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #accessing }
GtAlgorithmerMethodHeaderViewModel >> method [
	^ method
]

{ #category : #accessing }
GtAlgorithmerMethodHeaderViewModel >> method: anObject [
	method := anObject
]

{ #category : #'api - view model' }
GtAlgorithmerMethodHeaderViewModel >> nameLabel [
	^ self method name, '()'
]

{ #category : #'api - view model' }
GtAlgorithmerMethodHeaderViewModel >> returnTypeLabel [
	^ self method returnType accept: GtAlgorithmerReturnTypePrinter new
]
