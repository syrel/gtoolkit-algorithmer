Class {
	#name : #GtAlgorithmerFieldValuePrinter,
	#superclass : #Object,
	#traits : 'TGtAlgorithmerBlockVisitor',
	#classTraits : 'TGtAlgorithmerBlockVisitor classTrait',
	#category : #'GToolkit-Algorithmer-UI-Helpers'
}

{ #category : #'visiting - blocks' }
GtAlgorithmerFieldValuePrinter >> visitPushHeapBlock: aPushHeapBlock [
	^ aPushHeapBlock object printString
]
