Class {
	#name : #PreActionIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
PreActionIteratorTest >> createIteratorOn: anIterator [
	^ (PreActionIterator decorate: anIterator)
			block: [ :x | 42 ]; "Result of the block is discarded."
			yourself
]

{ #category : #accessing }
PreActionIteratorTest >> iteratorWalk [
	^ #(1 2 3 4 5 6 7 8 9 10)
]

{ #category : #tests }
PreActionIteratorTest >> testExectionOrder [
	| order |
	order := OrderedCollection new.
	iterator := (self objectToWalk
						outputTo: (PreActionIterator block: [ :x | order add: 1 ]))
						outputTo: (PreActionIterator block: [ :x | order add: 2 ]).
	
	iterator upToEndDiscardingResult.
	
	self assertCollection: order asArray equals: #(2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1)
]
