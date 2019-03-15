"
A SequenceableCollectionIteratorTest is a test class for testing the behavior of SequenceableCollectionIterator
"
Class {
	#name : #SequentialAccessIteratorTest,
	#superclass : #IteratorTest,
	#category : #'Iterators-Tests-Core'
}

{ #category : #'iterator creation' }
SequentialAccessIteratorTest >> createIteratorOn: anObject [
	^ SequentialAccessIterator on: anObject
]

{ #category : #accessing }
SequentialAccessIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ { 1 . $a . 'str' . 3.14 }
]

{ #category : #accessing }
SequentialAccessIteratorTest >> objectToWalk [
	^ self iteratorWalk asOrderedCollection
]
