Class {
	#name : #GtAlgorithmerMethodExamples,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Examples-Composition'
}

{ #category : #examples }
GtAlgorithmerMethodExamples >> assignX [
	<gtExample>
	| aMethod |

	aMethod := GtAlgorithmerMethod new
		name: #setX;
		arguments: ({ GtAlgorithmerMethodArgument new
			name: #newX;
			type: GtAlgorithmerFloat32Type new });
		body: (GtAlgorithmerAssignStructureFieldBlock new
			name: #x
			block: (GtAlgorithmerReadMethodArgumentBlock new name: #newX)).

	^ aMethod
]

{ #category : #examples }
GtAlgorithmerMethodExamples >> return42 [
	<gtExample>
	| aMethod |

	aMethod := GtAlgorithmerMethod new
		name: #return42;
		returnType: GtAlgorithmerInt32Type new;
		body: (GtAlgorithmerPushHeapBlock new object: 42).

	^ aMethod
]

{ #category : #examples }
GtAlgorithmerMethodExamples >> returnLargeInteger [
	<gtExample>
	| aMethod |

	aMethod := GtAlgorithmerMethod new
		name: #returnVeryLargeInteger;
		returnType: GtAlgorithmerInt32Type new;
		body: (GtAlgorithmerPushHeapBlock new object: 4302365).

	^ aMethod
]

{ #category : #examples }
GtAlgorithmerMethodExamples >> returnPi [
	<gtExample>
	| aMethod |

	aMethod := GtAlgorithmerMethod new
		name: #returnPi;
		returnType: GtAlgorithmerFloat32Type new;
		body: (GtAlgorithmerPushHeapBlock new object: Float pi).

	^ aMethod
]

{ #category : #'examples - rust' }
GtAlgorithmerMethodExamples >> rustAssignX [
	| rustSource |
	<gtExample>

	rustSource := self assignX accept: GtAlgorithmerRustExporter new.
	self assert: rustSource equals:
'pub fn set_x(&mut self, new_x: f32) {
  self.x = { new_x };
}'.

	^ rustSource
]

{ #category : #'examples - rust' }
GtAlgorithmerMethodExamples >> rustReturn42 [
	| rustSource |
	<gtExample>

	rustSource := self return42 accept: GtAlgorithmerRustExporter new.
	self assert: rustSource equals:
'pub fn return_42(&self) -> i32 {
  42
}'.

	^ rustSource
]

{ #category : #'examples - rust' }
GtAlgorithmerMethodExamples >> rustReturnPi [
	| rustSource |
	<gtExample>

	rustSource := self returnPi accept: GtAlgorithmerRustExporter new.
	self assert: rustSource equals:
'pub fn return_pi(&self) -> f32 {
  3.141592653589793
}'.

	^ rustSource
]
