"
A FlattenIteratorTest is a test class for testing the behavior of FlattenIterator
"
Class {
	#name : #FlattenIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
FlattenIteratorTest >> createIteratorOn: anObject [
	^ (FlattenIterator decorate: anObject)
]

{ #category : #accessing }
FlattenIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(1 2 3 4 5 6 7 8 9 10)
]

{ #category : #accessing }
FlattenIteratorTest >> objectToWalk [
	^ SequentialAccessIterator on: #((1 2) (3 4 5) (6 7) (8) (9 10))
]

{ #category : #tests }
FlattenIteratorTest >> testEmptyCollectionToFlattenWorks [
	iterator := self createIteratorOn: #((1) () (2)) iterator.
	
	self assert: iterator next equals: 1.
	self assert: iterator next equals: 2.
	
	self should: [ iterator next ] raise: IteratorIsAtEnd
]

{ #category : #tests }
FlattenIteratorTest >> testEmptyCollectionToFlattenWorks2 [
	iterator := self createIteratorOn: #((1) (2) ()) iterator.
	
	self assert: iterator upToEnd equals: #(1 2)
]
