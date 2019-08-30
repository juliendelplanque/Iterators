Class {
	#name : #IteratorDecoratorWithInternalIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock @ {#traitBlock:->#block:}',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#instVars : [
		'iteratorToDecorateWhenPossible',
		'internalIterator'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
IteratorDecoratorWithInternalIterator >> block: aBlock [
	self traitBlock: aBlock.
	self decoratedIterator: iteratorToDecorateWhenPossible
]

{ #category : #private }
IteratorDecoratorWithInternalIterator >> buildInternalIterator [
	^ self subclassResponsibility
]

{ #category : #accessing }
IteratorDecoratorWithInternalIterator >> decoratedIterator [
	"Here we lie so the clients do not realise we use multiple iterators internally."
	^ internalIterator decoratedIteratorsIterator last in: [ :lastIterator |
		lastIterator isDecorator
			ifTrue: [ nil ]
			ifFalse: [ lastIterator ] ]
		
]

{ #category : #accessing }
IteratorDecoratorWithInternalIterator >> decoratedIterator: anIterator [
	iteratorToDecorateWhenPossible := anIterator.
	self resetInternalIteratorIfPossible.
	internalIterator ifNotNil: [ 
		internalIterator decoratedIteratorsIterator last decoratedIterator: anIterator ].
	^ super decoratedIterator: internalIterator
]

{ #category : #testing }
IteratorDecoratorWithInternalIterator >> hasNext [
	^ internalIterator hasNext
]

{ #category : #accessing }
IteratorDecoratorWithInternalIterator >> next [
	^ internalIterator next
]

{ #category : #accessing }
IteratorDecoratorWithInternalIterator >> peek [
	^ internalIterator peek
]

{ #category : #private }
IteratorDecoratorWithInternalIterator >> resetInternalIteratorIfPossible [
	internalIterator := nil.
	self block ifNil: [ ^ self ].
	internalIterator := self buildInternalIterator
]
