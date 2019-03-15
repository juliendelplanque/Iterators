"
I transform the object returned by #next method of the iterator I decorate using the result of the evalution of my #block with this object as argument.
"
Class {
	#name : #CollectIterator,
	#superclass : #IteratorDecoratorWithBlock,
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
CollectIterator >> next [
	^ self block value: super next
]

{ #category : #accessing }
CollectIterator >> peek [
	^ self block value: super peek
]
