Class {
	#name : #GtAlgorithmerRustExporter,
	#superclass : #Object,
	#traits : 'TGtAlgorithmerTypeVisitor + TGtAlgorithmerBlockVisitor + TGtAlgorithmerCompositionVisitor',
	#classTraits : 'TGtAlgorithmerTypeVisitor classTrait + TGtAlgorithmerBlockVisitor classTrait + TGtAlgorithmerCompositionVisitor classTrait',
	#instVars : [
		'binary',
		'indentation',
		'depth',
		'operators'
	],
	#category : #'GToolkit-Algorithmer-Exporter-Rust'
}

{ #category : #private }
GtAlgorithmerRustExporter >> decreaseDepth [
	depth := (depth - 1) max: 0
]

{ #category : #private }
GtAlgorithmerRustExporter >> doesMethodMutateStructure: aMethod [
	^ aMethod accept: GtAlgorithmerStructureMutabilityDetector new
]

{ #category : #private }
GtAlgorithmerRustExporter >> increaseDepth [
	depth := depth + 1
]

{ #category : #initialization }
GtAlgorithmerRustExporter >> initialize [
	super initialize.

	binary := #(* / % + - << >> & #'^' | == != < > <= >= && || = += -= *= /= %= &= |= #'^' = <<= >>=) asSet.
	indentation := String space, String space.
	depth := 0.
	
	operators := { 
		#= -> #==.
	} asOrderedDictionary
]

{ #category : #private }
GtAlgorithmerRustExporter >> printDepthIndentationOn: aStream [
	depth timesRepeat: [ aStream nextPutAll: indentation ]
]

{ #category : #private }
GtAlgorithmerRustExporter >> rustifyMethodName: aMethodName [
	| rustifiedName |
	
	rustifiedName := aMethodName.
	rustifiedName := rustifiedName trimRight: [ :c | c = $: ].
	rustifiedName := rustifiedName copyReplaceAll: ':' with: '_'.
	
	(rustifiedName size > 1
		and: [ rustifiedName last isUppercase
			and: [ rustifiedName nextToLast isLowercase ] ])
		ifTrue: [rustifiedName := rustifiedName allButLast, '_', rustifiedName last asLowercase asString ].
	
	^ String streamContents: [ :aStream |
			rustifiedName gtPiecesCutWhereCamelCase
				do: [ :eachPiece | aStream nextPutAll: eachPiece asLowercase ]
				separatedBy: [ aStream nextPut: $_ ] ]
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitAssignStructureFieldBlock: anAssignStructureFieldBlock [
	^ 'self.', (self rustifyMethodName: anAssignStructureFieldBlock name), ' = { ', (anAssignStructureFieldBlock valueBlock accept: self), ' }'
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitAssignVariableBlock: anAssignVariableBlock [
	^ (self rustifyMethodName: anAssignVariableBlock name), ' = { ', (anAssignVariableBlock valueBlock accept: self), ' }'
]

{ #category : #'visiting - types' }
GtAlgorithmerRustExporter >> visitBooleanType: aVoidType [
	^ 'bool'
]

{ #category : #'visiting - composition' }
GtAlgorithmerRustExporter >> visitClass: anAlgorithmerClass [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: (anAlgorithmerClass structure accept: self);
			cr;
			cr.
		
		anAlgorithmerClass implementations
			do: [ :eachImplementation |
				aStream nextPutAll: (eachImplementation accept: self) ]
			separatedBy: [ aStream cr; cr ] ]
]

{ #category : #'visiting - composition' }
GtAlgorithmerRustExporter >> visitClassImplementation: anImplemenation [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: '///';
			space;
			nextPutAll: anImplemenation label;
			cr;
			nextPutAll: 'impl';
			space;
			nextPutAll: anImplemenation algorithmerClass name;
			space;
			nextPut: ${;
			cr.

		self increaseDepth.
		self printDepthIndentationOn: aStream.
		
		anImplemenation methods
			do: [ :eachMethod |
				aStream nextPutAll: (eachMethod accept: self)
			] separatedBy: [
				aStream cr.
				self printDepthIndentationOn: aStream ].
		
		self decreaseDepth.
		aStream
			cr.
			
		self printDepthIndentationOn: aStream.
		aStream nextPut: $} ]
]

{ #category : #'visiting - types' }
GtAlgorithmerRustExporter >> visitClassType: aClassType [
	^ 'Rc<RefCell<{1}>>' format: { aClassType name }
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitDefineVariableBlock: aDefineVariableBlock [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'let';
			space.
		
		aDefineVariableBlock isMutable
			ifTrue: [ aStream nextPutAll: 'mut'; space ].
			
		aStream
			nextPutAll: (self rustifyMethodName: aDefineVariableBlock name).
			
		aDefineVariableBlock type
			ifNotNil: [
				aStream 
					nextPut: $:;
					space;
					nextPutAll: aDefineVariableBlock type asString  ] ]
]

{ #category : #'visiting - types' }
GtAlgorithmerRustExporter >> visitFloat32Type: aFloat32Type [
	^ 'f32'
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitIfBlock: anIfBlock [	
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'if';
			space;
			nextPutAll: (anIfBlock conditionBlock accept: self);
			space;
			nextPut: ${;
			cr.

		self increaseDepth.
		self printDepthIndentationOn: aStream.
		aStream nextPutAll: (anIfBlock trueBlock accept: self).
		self decreaseDepth.
		
		aStream cr.
		self printDepthIndentationOn: aStream.
		aStream nextPutAll: '}'.
		
		anIfBlock falseBlock
			ifNotNil: [ :aFalseBlock |
				aStream nextPutAll: ' else {'; cr.
				self increaseDepth.
				self printDepthIndentationOn: aStream.
				aStream nextPutAll: (aFalseBlock accept: self).
				self decreaseDepth.
				aStream cr.
				self printDepthIndentationOn: aStream.
				aStream nextPutAll: '}' ] ]
]

{ #category : #'visiting - types' }
GtAlgorithmerRustExporter >> visitInt32Type: anInt32Type [
	^ 'i32'
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitMessageSendBlock: aMessageSendBlock [
	^ String streamContents: [ :aStream |
		aStream nextPutAll: (aMessageSendBlock receiverBlock accept: self).
		(binary includes: aMessageSendBlock selector)
			ifTrue: [
				aStream
					space;
					nextPutAll: aMessageSendBlock selector;
					space;
					nextPutAll: (aMessageSendBlock argumentBlocks first accept: self) ]
			ifFalse: [
				aStream
					nextPut: $.;
					nextPutAll: (self rustifyMethodName: aMessageSendBlock selector);
					nextPut: $(.
				aMessageSendBlock argumentBlocks
					do: [ :eachArgument | aStream nextPutAll: (eachArgument accept: self) ]
					separatedBy: [ aStream nextPut: $,; space ].
				aStream nextPut: $) ] ]
]

{ #category : #'visiting - composition' }
GtAlgorithmerRustExporter >> visitMethod: anAlgorithmerMethod [
	^ String streamContents: [ :aStream |
		anAlgorithmerMethod isFromTrait
			ifFalse: [ aStream nextPutAll: 'pub'; space ].
		
		aStream
			nextPutAll: 'fn';
			space;
			nextPutAll: (self rustifyMethodName: anAlgorithmerMethod name);
			nextPut: $(.

		(self doesMethodMutateStructure: anAlgorithmerMethod)
			ifTrue: [ aStream nextPutAll: '&mut self' ]
			ifFalse: [ aStream nextPutAll: '&self' ].

		anAlgorithmerMethod arguments
			do: [ :eachArgument |
				aStream
					nextPut: $,;
					space;
					nextPutAll: (self rustifyMethodName: eachArgument name);
					nextPut: $:;
					space;
					nextPutAll: (eachArgument type accept: self) ].
			
		aStream nextPut: $).
		
			
		anAlgorithmerMethod hasReturn
			ifTrue: [
				aStream
					space;
					nextPutAll: '->';
					space;
					nextPutAll: (anAlgorithmerMethod returnType accept: self) ].

		anAlgorithmerMethod body
			ifNotNil: [ :aBody |
				aStream
					space;
					nextPut: ${;
					cr.

				self increaseDepth.
				self printDepthIndentationOn: aStream.
				aStream nextPutAll: (anAlgorithmerMethod body accept: self).
				
				anAlgorithmerMethod hasReturn
					ifFalse: [ aStream nextPut: $; ].
				
				self decreaseDepth.
				aStream
					cr.
				self printDepthIndentationOn: aStream.
				aStream nextPut: $} ]
			ifNil: [ aStream nextPut: $; ] ]
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitOperatorBlock: anOperatorBlock [
	^ String streamContents: [ :aStream |
		aStream nextPutAll: (anOperatorBlock leftOperand accept: self).
		aStream space.
		
		operators
			at: anOperatorBlock operator
			ifPresent: [ :aRustOperator | aStream nextPutAll: aRustOperator ]
			ifAbsent: [ aStream nextPutAll: anOperatorBlock operator ].
		
		aStream space.
		aStream nextPutAll: (anOperatorBlock rightOperand accept: self) ].
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitPrintlnBlock: aPrintlnBlock [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'println!("{}", ';
			nextPutAll: (aPrintlnBlock valueBlock accept: self);
			nextPutAll: ')' ]
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitPushHeapBlock: aPushHeapBlock [
	^ String streamContents: [ :aStream |
		aPushHeapBlock object isString
			ifTrue: [
				aStream
					nextPut: $";
					nextPutAll: aPushHeapBlock object;
					nextPut: $" ]
			ifFalse: [ aStream print: aPushHeapBlock object ] ]
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitReadMethodArgumentBlock: aReadMethodArgumentBlock [
	^ self rustifyMethodName: aReadMethodArgumentBlock name
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitReadStructureFieldBlock: aReadStructureField [
	^ 'self.', (self rustifyMethodName: aReadStructureField name)
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitReadVariableBlock: aVariableBlock [
	^ aVariableBlock name
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitSequenceBlock: aSequenceBlock [
	^ String streamContents: [ :aStream |
		aSequenceBlock blocks do: [ :each |
			each == aSequenceBlock blocks first
				ifFalse: [ self printDepthIndentationOn: aStream ].
			aStream
				nextPutAll: (each accept: self)
		] separatedBy: [ aStream nextPut: $;; cr ] ]
]

{ #category : #'visiting - composition' }
GtAlgorithmerRustExporter >> visitStructure: anAlgorithmerStructure [
	^ String streamContents: [ :aStream |
		aStream nextPutAll: (self visitStructureHeader: anAlgorithmerStructure).
		
		aStream cr; cr.
		
		aStream nextPutAll: (self visitStructureConstructor: anAlgorithmerStructure) ]
]

{ #category : #'visiting - composition' }
GtAlgorithmerRustExporter >> visitStructureConstructor: anAlgorithmerStructure [
	^ String streamContents: [ :aStream |
		self printDepthIndentationOn: aStream.
		aStream
			nextPutAll: 'impl';
			space;
			nextPutAll: anAlgorithmerStructure name;
			space;
			nextPut: ${;
			cr.
			
		self increaseDepth.
		
		self printDepthIndentationOn: aStream.
		
		aStream
			nextPutAll: 'fn new() -> Self {';
			cr.
		
		self increaseDepth.
		self printDepthIndentationOn: aStream.
		
		aStream
			nextPutAll: 'Self {';
			cr.
			
		self increaseDepth.
		
		anAlgorithmerStructure fields do: [ :eachField |
			self printDepthIndentationOn: aStream.
			aStream
				nextPutAll: eachField name;
				nextPut: $:;
				space.
				
			eachField valueOrDefaultBlock
				ifNil: [ aStream nextPutAll: 'None' ]
				ifNotNil: [ :aDefaultBlock | aStream nextPutAll: (aDefaultBlock accept: self)  ]
			
		] separatedBy: [ aStream nextPut: $, ;cr ].
			
		self decreaseDepth.
		
		aStream cr.
		self printDepthIndentationOn: aStream.
		aStream nextPut: $}.
		
		self decreaseDepth.
		
		aStream cr.
		self printDepthIndentationOn: aStream.
		aStream nextPut: $}.
		
		self decreaseDepth.
		
		aStream
			cr.
		
		self printDepthIndentationOn: aStream.
		
		aStream nextPut: $} ]
	
"impl InstanceConstructor for OffsetLayer {
    fn new() -> Self {
        Self {
            layers: vec![],
            offset: Point::new(0.0, 0.0),
        }
    }
}"
]

{ #category : #'visiting - composition' }
GtAlgorithmerRustExporter >> visitStructureField: anAlgorithmerStructureField [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'pub';
			space;
			nextPutAll: (self rustifyMethodName: anAlgorithmerStructureField name);
			nextPut: $:;
			space.

		anAlgorithmerStructureField valueOrDefaultBlock
			ifNil: [
				aStream
					nextPutAll: 'Option';
					nextPut: $< ].

		aStream
			nextPutAll: (anAlgorithmerStructureField type accept: self).

		anAlgorithmerStructureField valueOrDefaultBlock
			ifNil: [ aStream nextPut: $> ] ]
]

{ #category : #'visiting - composition' }
GtAlgorithmerRustExporter >> visitStructureHeader: anAlgorithmerStructure [
	^ String streamContents: [ :aStream |
		self printDepthIndentationOn: aStream.
		aStream
			nextPutAll: 'pub';
			space;
			nextPutAll: 'struct';
			space;
			nextPutAll: anAlgorithmerStructure name;
			space;
			nextPut: ${;
			cr.
			
		self increaseDepth.
		
		anAlgorithmerStructure fields do: [ :eachField |
			self printDepthIndentationOn: aStream.
			aStream nextPutAll: (eachField accept: self)
		] separatedBy: [ aStream nextPut: $,; cr ].
		self decreaseDepth.
		
		aStream
			cr.
		
		self printDepthIndentationOn: aStream.
		
		aStream nextPut: $} ]
]

{ #category : #'visiting - composition' }
GtAlgorithmerRustExporter >> visitTrait: anAlgorithmerTrait [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'pub trait';
			space;
			nextPutAll: anAlgorithmerTrait name;
			space;
			nextPut: ${;
			cr.

		self increaseDepth.
		self printDepthIndentationOn: aStream.
		
		anAlgorithmerTrait methods
			do: [ :eachMethod |
				aStream nextPutAll: (eachMethod accept: self)
			] separatedBy: [
				aStream cr.
				self printDepthIndentationOn: aStream ].
		
		self decreaseDepth.
		aStream
			cr.
			
		self printDepthIndentationOn: aStream.
		aStream nextPut: $} ]
]

{ #category : #'visiting - composition' }
GtAlgorithmerRustExporter >> visitTraitImplementation: aTraitImplemenation [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'impl';
			space;
			nextPutAll: aTraitImplemenation trait name;
			space;
			nextPutAll: 'for';
			space;
			nextPutAll: aTraitImplemenation algorithmerClass name;
			nextPut: ${;
			cr.

		self increaseDepth.
		self printDepthIndentationOn: aStream.
		
		aTraitImplemenation methods
			do: [ :eachMethod |
				aStream nextPutAll: (eachMethod accept: self)
			] separatedBy: [
				aStream cr.
				self printDepthIndentationOn: aStream ].
		
		self decreaseDepth.
		aStream
			cr.
			
		self printDepthIndentationOn: aStream.
		aStream nextPut: $} ]
]

{ #category : #'visiting - types' }
GtAlgorithmerRustExporter >> visitTraitType: aTraitType [
	^ 'Rc<RefCell<dyn {1}>>' format: { aTraitType name }
]

{ #category : #'visiting - types' }
GtAlgorithmerRustExporter >> visitUnknownType: anUnknownType [
	^ 'unknown'
]

{ #category : #'visiting - types' }
GtAlgorithmerRustExporter >> visitVoidType: aVoidType [
	^ ''
]

{ #category : #'visiting - blocks' }
GtAlgorithmerRustExporter >> visitWhileBlock: aWhileBlock [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'while';
			space;
			nextPut: $(.
			
		aStream nextPutAll: (aWhileBlock condition accept: self).
		
		aStream
			nextPut: $);
			space;
			nextPut: ${;
			cr.
			
		self increaseDepth.
		self printDepthIndentationOn: aStream.
		aStream nextPutAll: (aWhileBlock loop accept: self).
		self decreaseDepth.
		
		aStream cr.
		self printDepthIndentationOn: aStream.
		aStream nextPut: $} ]
]
