Class {
	#name : #SelectIterator,
	#superclass : #IteratorDecoratorWithBlock,
	#category : #'Iterators-Decorators'
}

{ #category : #testing }
SelectIterator >> hasNext [
	[ self peek ] on: IteratorIsAtEnd do: [ ^ false ]. "Pass all objects for which #block returns false."
	^ super hasNext
]

{ #category : #accessing }
SelectIterator >> next [
	self peek. "Pass all objects for which #block returns false."
	^ super next
]

{ #category : #accessing }
SelectIterator >> peek [
	"Pass all objects for which #block returns false or peek is nil, then return the object peeked."
	|peeked caughtIteratorAtEnd|
	caughtIteratorAtEnd := false.
	[ ([ peeked := super peek. true ] on: IteratorIsAtEnd do: [ caughtIteratorAtEnd := true. false ])
			and: [ (self block value: peeked) not ]
	] whileTrue: [ super next ].
	caughtIteratorAtEnd ifTrue: [ self signalAtEnd ].
	^ peeked
]
