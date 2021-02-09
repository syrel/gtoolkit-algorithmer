Class {
	#name : #GtAlgorithmerClassImplementationElement,
	#superclass : #BlElement,
	#traits : 'TGtWithAlgorithmerClassImplementationViewModel + TBrLayoutResizable',
	#classTraits : 'TGtWithAlgorithmerClassImplementationViewModel classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'labelElement',
		'methodHeaders'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #initialization }
GtAlgorithmerClassImplementationElement >> initialize [
	super initialize.
	
	self layout: BlLinearLayout vertical.
	self fitContent.
	
	self background: Color white.
	self padding: (BlInsets top: 15 left: 15 bottom: 10 right: 15).
	self border: (BlBorder paint: Color lightGray width: 1).
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 4).

	labelElement := BrEditableLabel new
		look: (BrGlamorousEditableLabelLook new glamorousRegularFont fontSize: 0.9 fontEm).

	methodHeaders := BrVerticalPane new
		cellSpacing: 5;
		fitContent.

	self addChild: labelElement.
	self addChild: (BlElement new size: 0@10).
	self addChild: (BrLabel new
		look: (BrGlamorousLabelLook new foreground: Color gray);
		beSmallSize;
		text: 'Methods:').	
	self addChild: methodHeaders.
		
	self addChild: (BrLabel new
		look: (BrGlamorousLabelLook new foreground: Color lightGray);
		beMiniSize;
		padding: (BlInsets empty);
		text: 'Implementation';
		geometry: (BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new
			bottomLeft: 4;
			topLeft: 0;
			topRight: 0;
			bottomRight: 0));
		background: (Color gray alpha: 0.1);
		constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored horizontal alignRight ])
]

{ #category : #'api - algorithmer class implementation view model' }
GtAlgorithmerClassImplementationElement >> onAlgorithmerClassImplementationViewModelChanged [
	"Is sent when a new AlgorithmerClassImplementation view model is assigned to the element"
	
	labelElement text: self algorithmerClassImplementationViewModel displayLabel.
	
	methodHeaders removeChildren.
	methodHeaders addChildren: (self algorithmerClassImplementationViewModel methodHeaderViewModels
		collect: [ :eachMethodHeaderViewModel |
			GtAlgorithmerMethodHeaderElement new algorithmerMethodHeaderViewModel: eachMethodHeaderViewModel ])
]
