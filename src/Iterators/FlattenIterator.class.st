"
I flatten objects coming from the iterator I wrap by iterating on their #iterator.
"
Class {
	#name : #FlattenIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'subIterator'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #testing }
FlattenIterator >> hasNext [
	^ super hasNext or: [ subIterator isNotNil and: [ subIterator hasNext ] ]
]

{ #category : #accessing }
FlattenIterator >> next [
	self retrieveSubIteratorIfNeeded.
	^ subIterator next
]

{ #category : #accessing }
FlattenIterator >> peek [
	self retrieveSubIteratorIfNeeded.
	^ subIterator peek
]

{ #category : #private }
FlattenIterator >> retrieveSubIterator [
	^ self decoratedIterator next iterator
]

{ #category : #private }
FlattenIterator >> retrieveSubIteratorIfNeeded [
	(subIterator isNotNil and: [ subIterator hasNext ])
		ifTrue: [ ^ self ].
	
	^ subIterator := self retrieveSubIterator
]
