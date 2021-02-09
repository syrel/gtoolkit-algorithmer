Class {
	#name : #GtAlgorithmerStructureExamples,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Examples-Composition'
}

{ #category : #'export - rust' }
GtAlgorithmerStructureExamples >> rustStructureAddFieldName [
	| rustSource |
	<gtExample>

	rustSource := self structureAddFieldName accept: GtAlgorithmerRustExporter new.
	self assert: rustSource equals:
'pub struct Point {
  pub x: Option<unknown>,
  pub y: Option<unknown>
}

impl Point {
  fn new() -> Self {
    Self {
      x: None,
      y: None
    }
  }
}'.

	^ rustSource
]

{ #category : #'export - rust' }
GtAlgorithmerStructureExamples >> rustStructureAddFieldNameWithBooleanType [
	| rustSource |
	<gtExample>

	rustSource := self structureAddFieldNameWithBooleanType accept: GtAlgorithmerRustExporter new.
	self assert: rustSource equals:
'pub struct Point {
  pub x: bool,
  pub y: bool
}

impl Point {
  fn new() -> Self {
    Self {
      x: false,
      y: false
    }
  }
}'.

	^ rustSource
]

{ #category : #'export - rust' }
GtAlgorithmerStructureExamples >> rustStructureAddFieldNameWithFloatType [
	| rustSource |
	<gtExample>

	rustSource := self structureAddFieldNameWithFloatType accept: GtAlgorithmerRustExporter new.
	self assert: rustSource equals:
'pub struct Point {
  pub x: f32,
  pub y: f32
}

impl Point {
  fn new() -> Self {
    Self {
      x: 0.0,
      y: 0.0
    }
  }
}'.

	^ rustSource
]

{ #category : #'export - rust' }
GtAlgorithmerStructureExamples >> rustStructureAddFieldNameWithIntType [
	| rustSource |
	<gtExample>

	rustSource := self structureAddFieldNameWithIntType accept: GtAlgorithmerRustExporter new.
	self assert: rustSource equals:
'pub struct Point {
  pub x: i32,
  pub y: i32
}

impl Point {
  fn new() -> Self {
    Self {
      x: 0,
      y: 0
    }
  }
}'.

	^ rustSource
]

{ #category : #'export - rust' }
GtAlgorithmerStructureExamples >> rustStructureWithName [
	| rustSource |
	<gtExample>

	rustSource := self structureWithName accept: GtAlgorithmerRustExporter new.
	self assert: rustSource equals:
'pub struct Point {

}

impl Point {
  fn new() -> Self {
    Self {

    }
  }
}'.
	
	^ rustSource
]

{ #category : #examples }
GtAlgorithmerStructureExamples >> structureAddFieldName [
	<gtExample>
	| aStructure |
	
	aStructure := self structureWithName.
	aStructure addFieldName: 'x'.
	aStructure addFieldName: 'y'.

	^ aStructure
]

{ #category : #examples }
GtAlgorithmerStructureExamples >> structureAddFieldNameWithBooleanType [
	<gtExample>
	| aStructure |

	aStructure := self structureWithName.
	aStructure addFieldName: 'x' type: GtAlgorithmerBooleanType new.
	aStructure addFieldName: 'y' type: GtAlgorithmerBooleanType new.

	^ aStructure
]

{ #category : #examples }
GtAlgorithmerStructureExamples >> structureAddFieldNameWithFloatType [
	<gtExample>
	| aStructure |

	aStructure := self structureWithName.
	aStructure addFieldName: 'x' type: GtAlgorithmerFloat32Type new.
	aStructure addFieldName: 'y' type: GtAlgorithmerFloat32Type new.

	^ aStructure
]

{ #category : #examples }
GtAlgorithmerStructureExamples >> structureAddFieldNameWithIntType [
	<gtExample>
	| aStructure |

	aStructure := self structureWithName.
	aStructure addFieldName: 'x' type: GtAlgorithmerInt32Type new.
	aStructure addFieldName: 'y' type: GtAlgorithmerInt32Type new.

	^ aStructure
]

{ #category : #examples }
GtAlgorithmerStructureExamples >> structureWithName [
	<gtExample>
	| aStructure |
	
	aStructure := GtAlgorithmerStructure new
		name: 'Point'.

	self assert: aStructure name equals: 'Point'.
	self assert: aStructure hasFields not.

	^ aStructure
]
