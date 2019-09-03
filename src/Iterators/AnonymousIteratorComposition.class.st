"
I am an iterator for which the internal iterator is built via a block.
"
Class {
	#name : #AnonymousIteratorComposition,
	#superclass : #IteratorDecoratorWithInternalIterator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Decorators'
}

{ #category : #private }
AnonymousIteratorComposition >> buildInternalIterator [
	^ self block value
]
