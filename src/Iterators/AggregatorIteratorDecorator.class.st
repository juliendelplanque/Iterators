Class {
	#name : #AggregatorIteratorDecorator,
	#superclass : #IteratorDecorator,
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
