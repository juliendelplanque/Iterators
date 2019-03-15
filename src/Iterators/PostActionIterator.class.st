Class {
	#name : #PostActionIterator,
	#superclass : #ConditionalActionIteratorDecorator,
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
PostActionIterator >> next [
	| toReturn |
	toReturn := super next.
	self shouldApplyActionOnNext
		ifTrue: self block.
	^ toReturn
]
