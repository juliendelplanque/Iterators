"
An UntilIteratorTest is a test class for testing the behavior of UntilIterator
"
Class {
	#name : #UntilIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
UntilIteratorTest >> createIteratorOn: anObject [
	^ (UntilIterator decorate: anObject)
		block: [ :x | x = 5 ];
		yourself
]

{ #category : #accessing }
UntilIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(1 2 3 4)
]
