Class {
	#name : #IntervalIteratorTest,
	#superclass : #IteratorTest,
	#category : #'Iterators-Tests-Core'
}

{ #category : #'iterator creation' }
IntervalIteratorTest >> createIteratorOn: anObject [
	^ IntervalIterator new
			start: anObject first;
			end: anObject last;
			yourself
]

{ #category : #accessing }
IntervalIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(5 6 7 8 9 10)
]

{ #category : #accessing }
IntervalIteratorTest >> objectToWalk [
	^ (5 to: 10)
]
