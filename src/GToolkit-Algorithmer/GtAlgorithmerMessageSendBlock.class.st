Class {
	#name : #GtAlgorithmerMessageSendBlock,
	#superclass : #GtAlgorithmerCompositeBlock,
	#instVars : [
		'blocks',
		'receiverBlock',
		'selector',
		'argumentBlocks'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerMessageSendBlock >> accept: aVisitor [
	^ aVisitor visitMessageSendBlock: self
]

{ #category : #accessing }
GtAlgorithmerMessageSendBlock >> argumentBlocks [
	^ argumentBlocks
]

{ #category : #'api - block' }
GtAlgorithmerMessageSendBlock >> blockName [
	^ self receiverBlock blockName, ' ', self selector
]

{ #category : #accessing }
GtAlgorithmerMessageSendBlock >> blocks [
	^ blocks
]

{ #category : #initialization }
GtAlgorithmerMessageSendBlock >> initialize [
	super initialize
]

{ #category : #initialization }
GtAlgorithmerMessageSendBlock >> receiver: aReceiverBlock selector: aSelectorName [
	self
		receiver: aReceiverBlock
		selector: aSelectorName arguments: #()
]

{ #category : #initialization }
GtAlgorithmerMessageSendBlock >> receiver: aReceiverBlock selector: aSelectorName argument: anArgumentBlock [
	self
		receiver: aReceiverBlock
		selector: aSelectorName
		arguments: { anArgumentBlock }
]

{ #category : #initialization }
GtAlgorithmerMessageSendBlock >> receiver: aReceiverBlock selector: aSelectorName arguments: theArgumentBlocks [
	self
		assert: [ theArgumentBlocks isString not ]
		description: [ 'Must be a collection of variable blocks' ].

	self
		assert: [ aReceiverBlock isKindOf: GtAlgorithmerBlock ]
		description: [ 'Receiver must be a block' ].

	self
		assert: [ theArgumentBlocks allSatisfy: [ :eachArgument | eachArgument isKindOf: GtAlgorithmerBlock ] ]
		description: [ 'All arguments must be blocks' ].

	receiverBlock := aReceiverBlock.
	selector := aSelectorName asSymbol.
	argumentBlocks := theArgumentBlocks.

	blocks := Array streamContents: [ :aStream |
		aStream nextPutAll: theArgumentBlocks.
		aStream nextPut: (GtAlgorithmerPushHeapBlock new object: selector).
		aStream nextPut: receiverBlock.
		aStream nextPut: GtAlgorithmerPerformBlock new ]
]

{ #category : #accessing }
GtAlgorithmerMessageSendBlock >> receiverBlock [
	^ receiverBlock
]

{ #category : #accessing }
GtAlgorithmerMessageSendBlock >> selector [
	<return: #Symbol>

	^ selector
]
