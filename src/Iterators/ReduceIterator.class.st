Class {
	#name : #ReduceIterator,
	#superclass : #AggregatorIteratorDecorator,
	#instVars : [
		'reduceBlock'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #private }
ReduceIterator >> aggregateUpToEnd [
	aggregatedValue := self decoratedIterator next.
	[ self decoratedIterator hasNext ]
		whileTrue: [ 
			aggregatedValue := self reduceBlock value: aggregatedValue value: self decoratedIterator next ]
]

{ #category : #accessing }
ReduceIterator >> reduceBlock [
	^ reduceBlock
]

{ #category : #accessing }
ReduceIterator >> reduceBlock: anObject [
	reduceBlock := anObject
]
