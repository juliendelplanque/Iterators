"
I works as #detect: method on collections but for iterators.

Once I detected an element matching my #block, I have not more objects to provide so I raise IteratorIsAtEnd error.
"
Class {
	#name : #DetectIterator,
	#superclass : #IteratorDecoratorWithInternalIterator,
	#category : #'Iterators-Decorators'
}

{ #category : #private }
DetectIterator >> buildInternalIterator [
	^ self block selectIt decoratedBy: 1 limitIt
]
