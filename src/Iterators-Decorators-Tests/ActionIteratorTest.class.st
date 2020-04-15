Class {
	#name : #ActionIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
ActionIteratorTest >> createIteratorOn: anObject [
	^ (ActionIterator decorate: anObject)
		block: [ :x | 42 ]; "Result of the block is discarded"
		yourself
]

{ #category : #accessing }
ActionIteratorTest >> iteratorWalk [
	^ #(1 2 3 4 5 6 7 8 9 10)
]
