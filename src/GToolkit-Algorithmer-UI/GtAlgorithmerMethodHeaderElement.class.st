Class {
	#name : #GtAlgorithmerMethodHeaderElement,
	#superclass : #BlElement,
	#traits : 'TGtWithAlgorithmerMethodHeaderViewModel + TBrLayoutResizable',
	#classTraits : 'TGtWithAlgorithmerMethodHeaderViewModel classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'methodName',
		'returnType'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #initialization }
GtAlgorithmerMethodHeaderElement >> initialize [
	super initialize.
	
	self layout: BlLinearLayout horizontal alignCenterLeft.
	self vFitContent.
	self hMatchParent.

	self geometry: (BlRoundedRectangleGeometry cornerRadius: 3).

	methodName := BrLabel new
		margin: (BlInsets top: 3 left: 4 bottom: 3 right: 4);
		look: (BrGlamorousLabelLook new glamorousCodeFont fontSize: 0.85 fontEm).

	returnType := BrLabel new
		background: (Color gray alpha: 0.1);
		vMatchParent;
		margin: (BlInsets left: 10);
		padding: (BlInsets top: 0 left: 4 bottom: 0 right: 4);
		look: (BrGlamorousLabelLook new glamorousCodeFont foreground: Color darkGray ;fontSize: 0.75 fontEm).		

	self addChild: methodName.
	self addChild: (BlElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical exact: 0 ]).
	self addChild: returnType.
	
	self addLook: (BrStyleCommonLook new
		default: [ :s | s background: (Color gray alpha: 0.1) ];
		hovered: [ :s | s background: (Color gray alpha: 0.2) ]).
		
	self when: BlClickEvent do: [ :anEvent |
		anEvent consumed: true.
		anEvent currentTarget phlow spawnObject: (anEvent currentTarget algorithmerMethodHeaderViewModel method) ]
]

{ #category : #'api - algorithmer method header view model' }
GtAlgorithmerMethodHeaderElement >> onAlgorithmerMethodHeaderViewModelChanged [
	"Is sent when a new AlgorithmerMethodHeader view model is assigned to the element"
	
	methodName text: self algorithmerMethodHeaderViewModel nameLabel.
	returnType text: self algorithmerMethodHeaderViewModel returnTypeLabel
]
