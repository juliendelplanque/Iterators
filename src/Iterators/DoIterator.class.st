Class {
	#name : #DoIterator,
	#superclass : #IteratorDecoratorWithBlock,
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
DoIterator >> next [
	self block value: self peek.
	^ super next
]
