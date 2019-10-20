"
Returns objects from the decorated iterators until my #block evaluates to false for the object peeked from the decorated iterator.
"
Class {
	#name : #UntilIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #testing }
UntilIterator >> hasNext [
	^ self decoratedIterator hasNext and: [ (self block value: self decoratedIterator peek) not ]
]

{ #category : #accessing }
UntilIterator >> next [
	self checkHasNext.
	^ self decoratedIterator next
]

{ #category : #accessing }
UntilIterator >> peek [
	self checkHasNext.
	^ self decoratedIterator peek
]
