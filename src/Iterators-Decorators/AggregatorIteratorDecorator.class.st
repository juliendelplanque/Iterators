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
		'aggregatedValue',
		'returnedAggregatedValue'
	],
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #private }
AggregatorIteratorDecorator >> aggregateUpToEnd [
	self subclassResponsibility
]

{ #category : #testing }
AggregatorIteratorDecorator >> hasNext [
	^ returnedAggregatedValue not
]

{ #category : #initialization }
AggregatorIteratorDecorator >> initialize [
	super initialize.
	returnedAggregatedValue := false
]

{ #category : #accessing }
AggregatorIteratorDecorator >> maximalUpToEndSize [
	"Aggregators aggregate underlaying stream as a single object."
	^ 1
]

{ #category : #accessing }
AggregatorIteratorDecorator >> next [
	self peek.
	returnedAggregatedValue := true.
	^ aggregatedValue
]

{ #category : #accessing }
AggregatorIteratorDecorator >> peek [
	aggregatedValue
		ifNil: [ 
			self aggregateUpToEnd.
			^ aggregatedValue ].
	
	(returnedAggregatedValue not and: [ aggregatedValue isNotNil ]) ifTrue: [ ^ aggregatedValue ].
	
	self signalAtEnd
]
