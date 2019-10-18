"
A StreamIteratorTest is a test class for testing the behavior of StreamIterator
"
Class {
	#name : #StreamIteratorTest,
	#superclass : #IteratorTest,
	#category : #'Iterators-Streams-Tests'
}

{ #category : #'iterator creation' }
StreamIteratorTest >> createIteratorOn: anObject [
	^ StreamIterator new
		stream: anObject;
		yourself
]

{ #category : #accessing }
StreamIteratorTest >> iteratorWalk [
	^ #(1 2 3 4 5 6 7 8 9 10)
]

{ #category : #accessing }
StreamIteratorTest >> objectToWalk [
	^ #(1 2 3 4 5 6 7 8 9 10) readStream
]
