"
I create groups from incoming objects.
Those groups are delimited by my #objectToSplitOn.
Incoming objects matching #objectToSplitOn are not included in the groups I produce.
"
Class {
	#name : #SplitOnIterator,
	#superclass : #BufferizedIterator,
	#instVars : [
		'objectToSplitOn',
		'firstTimeAtEnd',
		'splittedOnLastObject'
	],
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #'as yet unclassified' }
SplitOnIterator class >> objectToSplitOn: objectToSplitOn [
	^ self new
		objectToSplitOn: objectToSplitOn;
		yourself
]

{ #category : #private }
SplitOnIterator >> bufferizeNext [
	| untilIterator |
	self decoratedIterator hasNext
		ifFalse: [ 
			firstTimeAtEnd
				ifTrue: [
					firstTimeAtEnd := false.
					splittedOnLastObject
						ifTrue: [ buffer := #() ]
						ifFalse: [ buffer := nil ] ]
				ifFalse: [ buffer := nil ].
			^ self ].
	
	untilIterator := self decoratedIterator
							outputTo: [ :object | self objectToSplitOn iteratorShouldSplit: object ] untilIt.
	
	buffer := untilIterator upToEnd.
	self decoratedIterator hasNext
		ifFalse: [ 
			^ self ].
	self decoratedIterator next.
	self decoratedIterator hasNext
		ifFalse: [ splittedOnLastObject := true ].
]

{ #category : #testing }
SplitOnIterator >> hasNext [
	buffer ifNil: [ self bufferizeNext ].
	
	^ buffer isNotNil
]

{ #category : #initialization }
SplitOnIterator >> initialize [
	super initialize.
	firstTimeAtEnd := true.
	splittedOnLastObject := false.
]

{ #category : #accessing }
SplitOnIterator >> objectToSplitOn [
	^ objectToSplitOn
]

{ #category : #accessing }
SplitOnIterator >> objectToSplitOn: anObject [
	objectToSplitOn := anObject
]
