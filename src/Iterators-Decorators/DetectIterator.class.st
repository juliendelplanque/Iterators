"
I works as #detect: method on collections but for iterators.

Once I detected an element matching my #block, I have not more objects to provide so I raise IteratorIsAtEnd error.
"
Class {
	#name : #DetectIterator,
	#superclass : #IteratorDecoratorWithInternalIterator,
	#traits : 'TIteratorDecoratorWithBlock @ {#traitBlock:->#block:}',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #accessing }
DetectIterator >> block: aBlock [
	self traitBlock: aBlock.
	self decoratedIterator: iteratorToDecorateWhenPossible
]

{ #category : #private }
DetectIterator >> buildInternalIterator [
	^ self block selectIt decoratedBy: 1 limitIt
]

{ #category : #private }
DetectIterator >> shouldRebuildInternalIterator [
	^ self block isNotNil
]
