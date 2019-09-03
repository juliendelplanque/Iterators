"
An IteratorDecoratorTest is a test class for testing the behavior of IteratorDecorator
"
Class {
	#name : #IteratorDecoratorTest,
	#superclass : #IteratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #testing }
IteratorDecoratorTest class >> isAbstract [
	^ self = IteratorDecoratorTest
]

{ #category : #accessing }
IteratorDecoratorTest >> objectToWalk [
	^ SequentialAccessIterator on: #(1 2 3 4 5 6 7 8 9 10)
]

{ #category : #test }
IteratorDecoratorTest >> testTakeAsInput [
	| decorated |
	decorated := IntervalIterator start: 1 end: 10.
	iterator takeAsInput: decorated.
	
	self assert: iterator decoratedIterator equals: decorated. 
]
