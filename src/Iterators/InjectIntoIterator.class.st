"
I am an iterator that works similary to #inject:into: method.

I evaluate my #accumulationBlock to accumulate over my #baseValue and return the result.

Such iterator will return a single object.
"
Class {
	#name : #InjectIntoIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'baseValue',
		'accumulationBlock',
		'accumulatedValue'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #private }
InjectIntoIterator >> accumulateUpToEnd [
	accumulatedValue := self baseValue.
	[ self decoratedIterator hasNext ]
		whileTrue: [ 
			accumulatedValue := self accumulationBlock value: accumulatedValue value: self decoratedIterator next ]
]

{ #category : #accessing }
InjectIntoIterator >> accumulationBlock [
	^ accumulationBlock
]

{ #category : #accessing }
InjectIntoIterator >> accumulationBlock: anObject [
	accumulationBlock := anObject
]

{ #category : #accessing }
InjectIntoIterator >> baseValue [
	^ baseValue
]

{ #category : #accessing }
InjectIntoIterator >> baseValue: anObject [
	baseValue := anObject
]

{ #category : #accessing }
InjectIntoIterator >> next [
	| toReturn |
	self peek.
	toReturn := accumulatedValue.
	accumulatedValue := nil.
	^ toReturn
]

{ #category : #accessing }
InjectIntoIterator >> peek [
	(self decoratedIterator hasNext and: [ accumulatedValue isNil ]) 
		ifTrue: [ 
			self accumulateUpToEnd.
			^ accumulatedValue ].
	
	accumulatedValue ifNotNil: [ ^ accumulatedValue ].
	
	self signalAtEnd
]
