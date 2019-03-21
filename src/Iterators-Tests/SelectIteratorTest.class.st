"
An SelectIteratorTest is a test class for testing the behavior of SelectIterator
"
Class {
	#name : #SelectIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
SelectIteratorTest >> createIteratorOn: anObject [
	^ (SelectIterator decorate: anObject)
			block: [ :x | x odd ];
			yourself
]

{ #category : #accessing }
SelectIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ (1 to: 10) select: [ :x | x odd ]
]
