"
I am an iterator that works similary to #inject:into: method.

I evaluate my #accumulationBlock to accumulate over my #baseValue and return the result.

Such iterator will return a single object.
"
Class {
	#name : #InjectIntoIterator,
	#superclass : #AggregatorIteratorDecorator,
	#instVars : [
		'baseValue',
		'accumulationBlock'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
InjectIntoIterator >> accumulationBlock [
	^ accumulationBlock
]

{ #category : #accessing }
InjectIntoIterator >> accumulationBlock: anObject [
	accumulationBlock := anObject
]

{ #category : #private }
InjectIntoIterator >> aggregateUpToEnd [
	aggregatedValue := self baseValue.
	[ self decoratedIterator hasNext ]
		whileTrue: [ 
			aggregatedValue := self accumulationBlock value: aggregatedValue value: self decoratedIterator next ]
]

{ #category : #accessing }
InjectIntoIterator >> baseValue [
	^ baseValue
]

{ #category : #accessing }
InjectIntoIterator >> baseValue: anObject [
	baseValue := anObject
]
