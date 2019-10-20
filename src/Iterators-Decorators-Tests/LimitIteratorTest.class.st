Class {
	#name : #LimitIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
LimitIteratorTest >> createIteratorOn: anObject [
	^ (LimitIterator decorate: anObject)
			limit: 2;
			yourself
]

{ #category : #accessing }
LimitIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(1 2)
]
