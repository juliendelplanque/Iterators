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
	self shouldApplyActionOnNext
		ifTrue: [ 
			| toReturn |
			self block value: (toReturn := super next).
			^ toReturn ].
	
	^ super next
]
