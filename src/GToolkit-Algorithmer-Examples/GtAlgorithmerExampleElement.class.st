Class {
	#name : #GtAlgorithmerExampleElement,
	#superclass : #Object,
	#traits : 'TGtAlgorithmerExampleElement',
	#classTraits : 'TGtAlgorithmerExampleElement classTrait',
	#instVars : [
		'children',
		'parent'
	],
	#category : #'GToolkit-Algorithmer-Examples-Traits'
}

{ #category : #accessing }
GtAlgorithmerExampleElement >> children [
	<return: #TGtAlgorithmerExampleChildren>

	^ children
]

{ #category : #accessing }
GtAlgorithmerExampleElement >> parent [
	<return: #TGtAlgorithmerExampleElement>

	^ parent
]
