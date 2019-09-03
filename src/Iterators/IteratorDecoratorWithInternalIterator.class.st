Class {
	#name : #IteratorDecoratorWithInternalIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'iteratorToDecorateWhenPossible',
		'internalIterator'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #private }
IteratorDecoratorWithInternalIterator >> buildInternalIterator [
	^ self subclassResponsibility
]

{ #category : #accessing }
IteratorDecoratorWithInternalIterator >> decoratedIterator [
	"Here we lie so the clients do not realise we use multiple iterators internally."
	^ [ (internalIterator decoratedIteratorsIterator decoratedBy: [ :iterator | 
			iterator = iteratorToDecorateWhenPossible ] detectIt) next
	] on: IteratorIsAtEnd do: [ nil ]
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
	self shouldRebuildInternalIterator ifFalse: [ ^ self ].
	internalIterator := self buildInternalIterator
]

{ #category : #private }
IteratorDecoratorWithInternalIterator >> shouldRebuildInternalIterator [
	^ true
]
