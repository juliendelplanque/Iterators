"
A WindowIteratorTest is a test class for testing the behavior of WindowIterator
"
Class {
	#name : #WindowIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
WindowIteratorTest >> createIteratorOn: anObject [
	^ (WindowIterator size: 2)
			decorate: anObject
]

{ #category : #accessing }
WindowIteratorTest >> iteratorWalk [
	^ #((1 2) (2 3) (3 4) (4 5) (5 6) (6 7) (7 8) (8 9) (9 10))
]
