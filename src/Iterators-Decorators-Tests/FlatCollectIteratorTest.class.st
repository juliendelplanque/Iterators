"
A FlatCollectIteratorTest is a test class for testing the behavior of FlatCollectIterator
"
Class {
	#name : #FlatCollectIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
FlatCollectIteratorTest >> createIteratorOn: anObject [
	^ (FlatCollectIterator decorate: anObject)
			block: [ :x | x * 2 ];
			yourself
]

{ #category : #accessing }
FlatCollectIteratorTest >> iteratorWalk [
	^ #(2 4 6 8 10 12 14 16 18 20)
]

{ #category : #accessing }
FlatCollectIteratorTest >> objectToWalk [
	^ SequentialAccessIterator on: #((1 2) () (3 4 5) (6 7) (8) (9 10) ())
]
