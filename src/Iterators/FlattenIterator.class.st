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
	| retrieved |
	retrieved := self decoratedIterator next iterator.
	"Manage the case when one of the sub-collection to flatten is empty.
	 In that case, a NullIterator is created. Such iterator will raise an IteratorIsAtEnd
	 error when #peek or #next is called on it.
	 However, some sub-collections might need to be flattened still.
	"
	retrieved hasNext 
		ifFalse: [ ^ self retrieveSubIterator ].
		
	^ retrieved
]

{ #category : #private }
FlattenIterator >> retrieveSubIteratorIfNeeded [
	(subIterator isNotNil and: [ subIterator hasNext ])
		ifTrue: [ ^ self ].
	
	^ subIterator := self retrieveSubIterator
]
