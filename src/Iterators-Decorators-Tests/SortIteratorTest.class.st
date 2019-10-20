"
A SortIteratorTest is a test class for testing the behavior of SortIterator
"
Class {
	#name : #SortIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
SortIteratorTest >> createIteratorOn: anObject [
	^ (SortIterator decorate: anObject)
		block: [ :x :y | x > y ];
		yourself
]

{ #category : #accessing }
SortIteratorTest >> iteratorWalk [
	^ #(10 9 8 7 6 5 4 3 2 1)
]
