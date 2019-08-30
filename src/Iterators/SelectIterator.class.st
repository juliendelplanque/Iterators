"
I select the object returned by #next method of the iterator I decorate using the result of the evalution of my #block with this object as argument.
I the evalution of the #block returns true, I return the object. Else I ignore the object and try the #next one.
"
Class {
	#name : #SelectIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
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
