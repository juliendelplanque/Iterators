"
A PerformCollectIteratorTest is a test class for testing the behavior of PerformCollectIterator
"
Class {
	#name : #PerformCollectIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
PerformCollectIteratorTest >> createIteratorOn: anObject [
	^ (PerformCollectIterator decorate: anObject)
			selector: #* arguments: #(2);
			yourself
]

{ #category : #accessing }
PerformCollectIteratorTest >> iteratorWalk [
	^ #(2 4 6 8 10 12 14 16 18 20)
]
