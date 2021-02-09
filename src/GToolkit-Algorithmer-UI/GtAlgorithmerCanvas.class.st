Class {
	#name : #GtAlgorithmerCanvas,
	#superclass : #BlCanvassableElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'structures',
		'implementations'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #adding }
GtAlgorithmerCanvas >> addClass: aGtAlgorithmerClass [
	| aStructureElement |
	aStructureElement := self addStructure: aGtAlgorithmerClass structure.
	
	aGtAlgorithmerClass implementations
		do: [ :eachImplementation |
			| eachImplementationElement |
			eachImplementationElement := self addImplementation: eachImplementation.
			
			self addChild: (BlLineElement new
				border: (BlBorder paint: (Color gray alpha: 0.2) width: 10);
				fromAnchor: (BlElementCenterAnchor element: eachImplementationElement);
				toAnchor: (BlElementCenterAnchor element: aStructureElement);
				zIndex: -10) ]
]

{ #category : #adding }
GtAlgorithmerCanvas >> addImplementation: aGtAlgorithmerImplementation [
	| aViewModel anElement |
	
	aViewModel := aGtAlgorithmerImplementation asAlgorithmerImplementationViewModel.
	anElement := aViewModel asAlgorithmerImplementationElement.
	
	anElement addEventHandler: BlPullHandler new.
	anElement beInSingleCompositionLayer.
	
	implementations add: anElement.
	self addChild: anElement.
	
	^ anElement
]

{ #category : #adding }
GtAlgorithmerCanvas >> addStructure: aGtAlgorithmerStructure [
	| aStructureElement |
	
	aStructureElement := GtAlgorithmerStructureElement new
		algorithmerStructureViewModel: (GtAlgorithmerStructureViewModel new structure: aGtAlgorithmerStructure).
		
	aStructureElement addEventHandler: BlPullHandler new.
	aStructureElement beInSingleCompositionLayer.
	
	structures add: aStructureElement.
	self addChild: aStructureElement.
	
	^ aStructureElement
]

{ #category : #initialization }
GtAlgorithmerCanvas >> initialize [
	super initialize.
	
	structures := OrderedCollection new.
	implementations := OrderedCollection new.
	
	self addEventHandler: BlSlideHandler new.
	self matchParent.
	self background: BrGlamorousColors backdropColor
]
