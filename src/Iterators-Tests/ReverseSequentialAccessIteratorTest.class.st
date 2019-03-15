"
A ReverseSequentialAccessIteratorTest is a test class for testing the behavior of ReverseSequentialAccessIterator
"
Class {
	#name : #ReverseSequentialAccessIteratorTest,
	#superclass : #SequentialAccessIteratorTest,
	#category : #'Iterators-Tests-Core'
}

{ #category : #'iterator creation' }
ReverseSequentialAccessIteratorTest >> createIteratorOn: anObject [
	^ ReverseSequentialAccessIterator on: anObject
]

{ #category : #accessing }
ReverseSequentialAccessIteratorTest >> objectToWalk [
	^ self iteratorWalk asOrderedCollection reversed
]
