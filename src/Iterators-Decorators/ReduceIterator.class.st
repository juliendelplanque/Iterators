"
I am an iterator that works similary to #reduce: method.

I evaluate reduce the objects I get from the stream using my #reduceBlock.

Such iterator will return a single object.
"
Class {
	#name : #ReduceIterator,
	#superclass : #AggregatorIteratorDecorator,
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #private }
ReduceIterator >> aggregateUpToEnd [
	aggregatedValue := self decoratedIterator next.
	[ self decoratedIterator hasNext ]
		whileTrue: [ 
			aggregatedValue := self block value: aggregatedValue value: self decoratedIterator next ]
]
