"
A DetectIteratorTest is a test class for testing the behavior of DetectIterator
"
Class {
	#name : #DetectIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
DetectIteratorTest >> createIteratorOn: anObject [
	^ (DetectIterator decorate: anObject)
			block: [ :x | x = 2 ];
			yourself
]

{ #category : #accessing }
DetectIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(2)
]
