Class {
	#name : #DepthFirstIterator,
	#superclass : #TreeIterator,
	#instVars : [
		'visitStack'
	],
	#category : #'Iterators-Core'
}

{ #category : #testing }
DepthFirstIterator >> hasNext [
	^ visitStack isNotEmpty
]

{ #category : #initialization }
DepthFirstIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	super initializeForRoot: anObject childrenBlock: aBlock.
	visitStack := Stack with: anObject
]

{ #category : #accessing }
DepthFirstIterator >> next [
	| next |
	self hasNext
		ifFalse: [ self signalAtEnd ].
	next := visitStack pop.
	(childrenBlock value: next) reverseDo: [ :child |
		visitStack push: child ].
	^ next
]

{ #category : #accessing }
DepthFirstIterator >> peek [
	self hasNext
		ifFalse: [ self signalAtEnd ].
	^ visitStack top
]
