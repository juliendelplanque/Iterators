"
A GroupedByIteratorTest is a test class for testing the behavior of GroupedByIterator
"
Class {
	#name : #GroupedByIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
GroupedByIteratorTest >> createIteratorOn: anObject [
	^ (GroupedByIterator decorate: anObject)
			block: [ :integer | integer even ];
			yourself
]

{ #category : #accessing }
GroupedByIteratorTest >> iteratorWalk [
	^ { false -> #(1 3 5 7 9). true -> #(2 4 6 8 10) }
]
