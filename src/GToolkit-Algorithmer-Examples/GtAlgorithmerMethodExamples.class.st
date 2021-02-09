Class {
	#name : #GtAlgorithmerMethodExamples,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Examples-Composition'
}

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
