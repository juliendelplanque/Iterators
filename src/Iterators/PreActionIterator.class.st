Class {
	#name : #PreActionIterator,
	#superclass : #ConditionalActionIteratorDecorator,
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
PreActionIterator >> next [
	self shouldApplyActionOnNext
		ifTrue: self block.
	^ super next
]
