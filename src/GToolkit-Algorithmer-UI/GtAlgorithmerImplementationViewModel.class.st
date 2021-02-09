Class {
	#name : #GtAlgorithmerImplementationViewModel,
	#superclass : #Object,
	#instVars : [
		'implementation',
		'methodHeaderViewModels'
	],
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #accessing }
GtAlgorithmerImplementationViewModel >> asAlgorithmerImplementationElement [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtAlgorithmerImplementationViewModel >> implementation [
	^ implementation
]

{ #category : #accessing }
GtAlgorithmerImplementationViewModel >> implementation: anObject [
	implementation := anObject.
	
	methodHeaderViewModels := implementation methods collect: [ :eachMethod | 
		GtAlgorithmerMethodHeaderViewModel new method: eachMethod ]
]

{ #category : #accessing }
GtAlgorithmerImplementationViewModel >> methodHeaderViewModels [
	^ methodHeaderViewModels
]
