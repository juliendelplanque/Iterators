"
I am an abstract iterator that aggregates the objects gathered from the iterator I wrap.

My concrete subclasses should implement #aggregateUpToEnd to define how to aggregate objects.
"
Class {
	#name : #AggregatorIteratorDecorator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#instVars : [
		'aggregatedValue'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #private }
AggregatorIteratorDecorator >> aggregateUpToEnd [
	self subclassResponsibility
]

{ #category : #accessing }
AggregatorIteratorDecorator >> next [
	| toReturn |
	self peek.
	toReturn := aggregatedValue.
	aggregatedValue := nil.
	^ toReturn
]

{ #category : #accessing }
AggregatorIteratorDecorator >> peek [
	(self decoratedIterator hasNext and: [ aggregatedValue isNil ]) 
		ifTrue: [ 
			self aggregateUpToEnd.
			^ aggregatedValue ].
	
	aggregatedValue ifNotNil: [ ^ aggregatedValue ].
	
	self signalAtEnd
]
