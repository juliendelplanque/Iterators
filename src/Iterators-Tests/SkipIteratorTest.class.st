"
A SkipIteratorTest is a test class for testing the behavior of SkipIterator
"
Class {
	#name : #SkipIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
SkipIteratorTest >> createIteratorOn: anObject [
	^ (SkipIterator decorate: anObject)
		count: 3;
		yourself
]

{ #category : #accessing }
SkipIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(4 5 6 7 8 9 10)
]
