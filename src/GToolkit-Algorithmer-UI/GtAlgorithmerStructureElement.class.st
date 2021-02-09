Class {
	#name : #GtAlgorithmerStructureElement,
	#superclass : #BrTabGroup,
	#traits : 'TGtWithAlgorithmerStructureViewModel',
	#classTraits : 'TGtWithAlgorithmerStructureViewModel classTrait',
	#instVars : [
		'nameElement',
		'fieldsElement'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #initialization }
GtAlgorithmerStructureElement >> initialize [
	super initialize.

	self layout: BlLinearLayout vertical.
	self fitContent.
	self background: Color white.
	self padding: (BlInsets top: 15 left: 15 bottom: 10 right: 15).
	self border: (BlBorder paint: Color lightGray width: 1).
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
	
	nameElement := BrEditableLabel new
		fitContent;
		look: (BrGlamorousEditableLabelLook new glamorousCodeFont fontSize: 1.2 fontEm).

	fieldsElement := BrVerticalPane new
		cellSpacing: 5;
		fitContent.
	
	self look: BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook.
	
	self addTab: (
		BrTab new
			look: BrGlamorousTabSwitcherWithIconLook new;
			label: 'Visual';
			stencil: [
				| aContainer |
				aContainer := BrVerticalPane new
					fitContent.
				
				aContainer addChild: nameElement.
				aContainer addChild: (BlElement new size: 0@10).
				aContainer addChild: (BrLabel new
					look: (BrGlamorousLabelLook new foreground: Color gray);
					beSmallSize;
					text: 'Fields:').
				aContainer addChild: fieldsElement.
				
				aContainer addChild: (BrLabel new
					look: (BrGlamorousLabelLook new foreground: Color lightGray);
					beMiniSize;
					padding: (BlInsets empty);
					text: 'Structure';
					geometry: (BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new
						bottomLeft: 4;
						topLeft: 0;
						topRight: 0;
						bottomRight: 0));
					background: (Color gray alpha: 0.1);
					constraintsDo: [ :c |
						c ignoreByLayout.
						c ignored horizontal alignRight ])]).
				
	self addTab: (
		BrTab new
			look: BrGlamorousTabSwitcherWithIconLook new;
			label: 'Rust';
			stencil: [ BrEditor new
				look: BrGlamorousCodeEditorLook;
				fitContent;
				text: self algorithmerStructureViewModel rustSourceCode ]).
]

{ #category : #'api - algorithmer structure view model' }
GtAlgorithmerStructureElement >> onAlgorithmerStructureViewModelChanged [
	"Is sent when a new AlgorithmerStructure view model is assigned to the element"
	| theFieldElements |

	nameElement text: self algorithmerStructureViewModel structureName.
	
	fieldsElement removeChildren.
	theFieldElements := self algorithmerStructureViewModel structureFieldViewModels collect: [ :eachFieldViewModel |
		GtAlgorithmerStructureFieldElement new
			algorithmerStructureFieldViewModel: eachFieldViewModel ].
	fieldsElement addChildren: theFieldElements
]
