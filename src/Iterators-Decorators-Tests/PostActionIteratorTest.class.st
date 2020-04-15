"
A PostActionIteratorTest is a test class for testing the behavior of PostActionIterator
"
Class {
	#name : #PostActionIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
PostActionIteratorTest >> createIteratorOn: anIterator [
	^ (PostActionIterator decorate: anIterator)
			block: [ :x | 42 ]; "Result of the block is discarded."
			yourself
]

{ #category : #accessing }
PostActionIteratorTest >> iteratorWalk [
	^ #(1 2 3 4 5 6 7 8 9 10)
]

{ #category : #tests }
PostActionIteratorTest >> testExectionOrder [
	| order |
	order := OrderedCollection new.
	iterator := (self objectToWalk
						outputTo: (PostActionIterator block: [ :x | order add: 1 ]))
						outputTo: (PostActionIterator block: [ :x | order add: 2 ]).
	
	iterator upToEndDiscardingResult.
	
	self assertCollection: order asArray equals: #(1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2)
]
