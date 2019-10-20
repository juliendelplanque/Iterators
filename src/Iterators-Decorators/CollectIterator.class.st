"
I transform the object returned by #next method of the iterator I decorate using the result of the evalution of my #block with this object as argument.
"
Class {
	#name : #CollectIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #accessing }
CollectIterator >> next [
	^ self block value: self decoratedIterator next
]

{ #category : #accessing }
CollectIterator >> peek [
	^ self block value: self decoratedIterator peek
]
