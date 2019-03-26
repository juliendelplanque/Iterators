"
I apply my action before #next is called on the iterator I decorate.
"
Class {
	#name : #PreActionIterator,
	#superclass : #ConditionalActionIteratorDecorator,
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
PreActionIterator >> next [
	self shouldApplyActionOnNext
		ifTrue: [ self block cull: self peek ].
	objectsSeenCount := objectsSeenCount + 1.
	^ super next
]
