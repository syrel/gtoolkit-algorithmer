Class {
	#name : #GtAlgorithmerStructureMutabilityDetector,
	#superclass : #Object,
	#traits : 'TGtAlgorithmerBlockVisitor + TGtAlgorithmerCompositionVisitor',
	#classTraits : 'TGtAlgorithmerBlockVisitor classTrait + TGtAlgorithmerCompositionVisitor classTrait',
	#category : #'GToolkit-Algorithmer-Visitor'
}

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitAssignStructureFieldBlock: anAssignStructureFieldBlock [
	^ true
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitAssignVariableBlock: anAssignVariableBlock [
	^ anAssignVariableBlock valueBlock accept: self
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitDefineVariableBlock: aDefineVariableBlock [
	^ false
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitIfBlock: anIfBlock [
	(anIfBlock conditionBlock accept: self)
		ifTrue: [ ^ true ].
		
	(anIfBlock trueBlock notNil and: [ anIfBlock trueBlock accept: self ])
		ifTrue: [ ^ true ].
		
	(anIfBlock falseBlock notNil and: [ anIfBlock falseBlock accept: self ])
		ifTrue: [ ^ true ].

	^ false
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitMessageSendBlock: aMessageSendBlock [
	(aMessageSendBlock argumentBlocks anySatisfy: [ :each | each accept: self ])
		ifTrue: [ ^ self ].
		
	^ aMessageSendBlock receiverBlock accept: self
]

{ #category : #'visiting - composition' }
GtAlgorithmerStructureMutabilityDetector >> visitMethod: anAlgorithmerMethod [
	^ anAlgorithmerMethod body accept: self
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitOperatorBlock: anOperatorBlock [
	^ (anOperatorBlock leftOperand accept: self)
		or: [ anOperatorBlock rightOperand accept: self ]
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitPrintlnBlock: aPrintlnBlock [
	^ aPrintlnBlock valueBlock accept: self
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitPushHeapBlock: aPushHeapBlock [
	^ false
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitReadMethodArgumentBlock: aReadMethodArgumentBlock [
	^ false
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitReadStructureFieldBlock: aReadStructureField [
	^ false
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitReadVariableBlock: aVariableBlock [
	^ false
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitSequenceBlock: aSequenceBlock [
	^ aSequenceBlock blocks anySatisfy: [ :eachBlock | eachBlock accept: self ]
]

{ #category : #'visiting - blocks' }
GtAlgorithmerStructureMutabilityDetector >> visitWhileBlock: aWhileBlock [
	^ (aWhileBlock conditionBlock accept: self) or: [ aWhileBlock loopBlock accept: self ]
]
