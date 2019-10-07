Class {
	#name : #SortIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#instVars : [
		'sortedObjectsIterator'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #testing }
SortIterator >> hasNext [
	sortedObjectsIterator
		ifNil: [ sortedObjectsIterator := ((self decoratedIterator upToEndAs: Array) sort: self block) basicIterator ].
		
	^ sortedObjectsIterator hasNext
]

{ #category : #accessing }
SortIterator >> next [
	self checkHasNext.
	^ sortedObjectsIterator next
]

{ #category : #accessing }
SortIterator >> peek [
	self checkHasNext.
	^ sortedObjectsIterator peek
]
