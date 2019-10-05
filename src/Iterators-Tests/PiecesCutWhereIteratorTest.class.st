"
A PiecesCutWhereIteratorTest is a test class for testing the behavior of PiecesCutWhereIterator
"
Class {
	#name : #PiecesCutWhereIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
PiecesCutWhereIteratorTest >> createIteratorOn: anObject [
	^ (PiecesCutWhereIterator decorate: anObject)
			block: [ :a :b | a = 1 and: [ b = 2]];
			yourself
]

{ #category : #accessing }
PiecesCutWhereIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(#(1) #(2 3 1 6 1) #(2 3 4))
]

{ #category : #accessing }
PiecesCutWhereIteratorTest >> objectToWalk [
	^ SequentialAccessIterator on: #(1 2 3 1 6 1 2 3 4)
]
