"
A SplitOnIteratorTest is a test class for testing the behavior of SplitOnIterator
"
Class {
	#name : #SplitOnIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
SplitOnIteratorTest >> createIteratorOn: anObject [
	^ (SplitOnIterator decorate: anObject)
		objectToSplitOn: [ :x | x even ];
		yourself
]

{ #category : #accessing }
SplitOnIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #((1) (3) (5) (7) (9) ())
]

{ #category : #tests }
SplitOnIteratorTest >> testNoEmptyCollectionAtEndIfNotSplitOnLastObject [
	iterator := self createIteratorOn: #(1 2 3) iterator.
	
	self assert: iterator next equals: #(1).
	self assert: iterator next equals: #(3).
	self deny: iterator hasNext
]
