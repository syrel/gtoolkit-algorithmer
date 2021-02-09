Class {
	#name : #GtAlgorithmerTraitExportExamples,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Examples-Traits'
}

{ #category : #examples }
GtAlgorithmerTraitExportExamples >> exportPaintTrait [
	<gtExample>
	| algorithmerTrait rustSourceCode |
	
	algorithmerTrait := GtAlgorithmerPharoImporter new visitTrait: TGtAlgorithmerExamplePaint.
	rustSourceCode := algorithmerTrait accept: GtAlgorithmerRustExporter new.
	
	self assert: rustSourceCode equals: 'pub trait TGtAlgorithmerExamplePaint {
  fn is_transparent(&mut self) -> bool {
    false
  }
  fn match_extent(&mut self);
  fn is_opaque(&mut self) -> bool {
    false
  }
}'.

	^ rustSourceCode
]
