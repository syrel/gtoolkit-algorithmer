Extension { #name : #GtAlgorithmerMethod }

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerMethod >> gtRustFor: aView [
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
