"
I works as #detect: method on collections but for iterators.

Once I detected an element matching my #block, I have not more objects to provide so I raise IteratorIsAtEnd error.
"
Class {
	#name : #DetectIterator,
	#superclass : #IteratorDecoratorWithBlock,
	#instVars : [
		'internalIterator',
		'iteratorToDecorateWhenPossible'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
DetectIterator >> block: aBlock [
	super block: aBlock.
	self decoratedIterator: iteratorToDecorateWhenPossible
]

{ #category : #accessing }
DetectIterator >> decoratedIterator [
	"Here we lie so the clients do not realise we use multiple iterators internally."
	^ internalIterator decoratedIteratorsIterator last in: [ :lastIterator |
		lastIterator isDecorator
			ifTrue: [ nil ]
			ifFalse: [ lastIterator ] ]
		
]

{ #category : #accessing }
DetectIterator >> decoratedIterator: anIterator [
	iteratorToDecorateWhenPossible := anIterator.
	self resetInternalIteratorIfPossible.
	internalIterator ifNotNil: [ 
		internalIterator decoratedIteratorsIterator last decoratedIterator: anIterator ].
	^ super decoratedIterator: internalIterator
]

{ #category : #testing }
DetectIterator >> hasNext [
	^ internalIterator hasNext
]

{ #category : #accessing }
DetectIterator >> next [
	^ internalIterator next
]

{ #category : #accessing }
DetectIterator >> peek [
	^ internalIterator peek
]

{ #category : #private }
DetectIterator >> resetInternalIteratorIfPossible [
	internalIterator := nil.
	self block ifNil: [ ^ self ].
	internalIterator := self block selectIt decoratedBy: 1 limitIt
]
