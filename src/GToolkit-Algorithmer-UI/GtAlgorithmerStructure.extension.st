Extension { #name : #GtAlgorithmerStructure }

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerStructure >> gtLiveFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Live';
		priority: 5;
		stencil: [
			| aStructureViewModel aStructureElement |
			
			aStructureViewModel := GtAlgorithmerStructureViewModel new
				structure: self.
				
			aStructureElement := GtAlgorithmerStructureElement new
				algorithmerStructureViewModel: aStructureViewModel.
			
			aStructureElement ]
]

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerStructure >> gtRustFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Rust';
		priority: 6;
		stencil: [
			BrEditor new
				matchParent;
				look: BrGlamorousCodeEditorLook new;
				text: (self accept: GtAlgorithmerRustExporter new) ]
]
