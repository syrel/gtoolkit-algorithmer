Class {
	#name : #GtAlgorithmerStructureFieldElement,
	#superclass : #BlElement,
	#traits : 'TGtWithAlgorithmerStructureFieldViewModel + TBrLayoutResizable',
	#classTraits : 'TGtWithAlgorithmerStructureFieldViewModel classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'nameElement',
		'typeElement',
		'valueElement'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #initialization }
GtAlgorithmerStructureFieldElement >> initialize [
	super initialize.
	
	self layout: BlLinearLayout horizontal alignCenterLeft.
	self fitContent.
	
	nameElement := BrEditableLabel new
		fitContent;
		look: BrGlamorousEditableLabelLook new glamorousCodeFont medium.

	typeElement := BrEditableLabel new
		fitContent;
		look: (BrGlamorousEditableLabelLook new glamorousCodeFont fontSize: 0.8 fontEm).
		
	valueElement := BrEditableLabel new
		fitContent;
		look: (BrGlamorousEditableLabelLook new glamorousCodeFont fontSize: 0.8 fontEm).

	self addChild: nameElement.
	self addChild: (BrLabel new
		look: BrGlamorousLabelLook new;
		beSmallSize;
		text: ':').
	self addChild: typeElement.
	self addChild: (BrLabel new
		look: BrGlamorousLabelLook new;
		beSmallSize;
		margin: (BlInsets left: 5 right: 5);
		text: '=').
	self addChild: valueElement
]

{ #category : #'api - algorithmer structure field view model' }
GtAlgorithmerStructureFieldElement >> onAlgorithmerStructureFieldViewModelChanged [
	"Is sent when a new AlgorithmerStructureField view model is assigned to the element"
	
	nameElement text: self algorithmerStructureFieldViewModel fieldName.
	typeElement text: self algorithmerStructureFieldViewModel typeName.
	typeElement look defaultForeground: (self algorithmerStructureFieldViewModel hasValidType
		ifTrue: [ Color veryDarkGray ]
		ifFalse: [ BrGlamorousColors linkWithErrorColor ]).
		
	valueElement text: self algorithmerStructureFieldViewModel valueDisplayLabel.
]
