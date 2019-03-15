"
A LinkedListIteratorTest is a test class for testing the behavior of LinkedListIterator
"
Class {
	#name : #LinkedListIteratorTest,
	#superclass : #IteratorTest,
	#category : #'Iterators-Tests-Core'
}

{ #category : #'iterator creation' }
LinkedListIteratorTest >> createIteratorOn: anObject [
	^ LinkedListIterator on: anObject nextLinkBlock: [ :link | link nextLink ] extractBlock: [ :link | link value ]
]

{ #category : #accessing }
LinkedListIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ { 1 . $a . 'str' . 3.14 }
]

{ #category : #accessing }
LinkedListIteratorTest >> objectToWalk [
	^ (self iteratorWalk as: LinkedList) firstLink
]
