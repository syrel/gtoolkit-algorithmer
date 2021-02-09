Class {
	#name : #GtAlgorithmerClassImplementationViewModel,
	#superclass : #GtAlgorithmerImplementationViewModel,
	#category : #'GToolkit-Algorithmer-UI-View Models'
}

{ #category : #accessing }
GtAlgorithmerClassImplementationViewModel >> asAlgorithmerImplementationElement [
	^ GtAlgorithmerClassImplementationElement new algorithmerClassImplementationViewModel: self
]

{ #category : #accessing }
GtAlgorithmerClassImplementationViewModel >> displayLabel [
	^ self implementation label
]
