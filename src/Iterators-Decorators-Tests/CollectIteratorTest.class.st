"
An CollectIteratorTest is a test class for testing the behavior of CollectIterator
"
Class {
	#name : #CollectIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
CollectIteratorTest >> createIteratorOn: anObject [
	^ (CollectIterator decorate: anObject)
			block: [ :x | x * 2 ];
			yourself
]

{ #category : #accessing }
CollectIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ (1 to: 10) collect: [ :x | x * 2 ]
]
