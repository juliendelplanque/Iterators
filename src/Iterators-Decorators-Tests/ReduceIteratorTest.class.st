"
A ReduceIteratorTest is a test class for testing the behavior of ReduceIterator
"
Class {
	#name : #ReduceIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
ReduceIteratorTest >> createIteratorOn: anObject [
	^ (ReduceIterator decorate: anObject)
			block: [ :x :y | x + y ];
			yourself
]

{ #category : #accessing }
ReduceIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(55)
]

{ #category : #tests }
ReduceIteratorTest >> testEmptyIterator [
	self should: [ (self createIteratorOn: NullIterator new) next ] raise: IteratorIsAtEnd
]
