"
I apply my action after #next has been called on the iterator I decorate.
"
Class {
	#name : #PostActionIterator,
	#superclass : #ConditionalActionIteratorDecorator,
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #accessing }
PostActionIterator >> next [
	| toReturn |
	toReturn := super next.
	self shouldApplyActionOnNext
		ifTrue: self block.
	^ toReturn
]
