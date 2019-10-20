"
A GroupsOfIteratorTest is a test class for testing the behavior of GroupsOfIterator
"
Class {
	#name : #GroupsOfIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
GroupsOfIteratorTest >> createIteratorOn: anObject [
	^ (GroupsOfIterator decorate: anObject)
			groupSize: 3;
			yourself
]

{ #category : #accessing }
GroupsOfIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #((1 2 3) (4 5 6) (7 8 9))
]
