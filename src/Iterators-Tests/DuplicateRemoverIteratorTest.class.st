"
A DuplicateRemoverIteratorTest is a test class for testing the behavior of DuplicateRemoverIterator
"
Class {
	#name : #DuplicateRemoverIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
DuplicateRemoverIteratorTest >> createIteratorOn: anObject [
	^ (DuplicateRemoverIterator decorate: anObject)
]

{ #category : #accessing }
DuplicateRemoverIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(1 2 6 7 9 10)
]

{ #category : #accessing }
DuplicateRemoverIteratorTest >> objectToWalk [
	^ SequentialAccessIterator on: #(1 2 1 1 1 6 7 7 7 9 10)
]
