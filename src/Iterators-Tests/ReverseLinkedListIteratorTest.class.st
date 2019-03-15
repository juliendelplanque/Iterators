"
A ReverseLinkedListIteratorTest is a test class for testing the behavior of ReverseLinkedListIterator
"
Class {
	#name : #ReverseLinkedListIteratorTest,
	#superclass : #LinkedListIteratorTest,
	#category : #'Iterators-Tests-Core'
}

{ #category : #'iterator creation' }
ReverseLinkedListIteratorTest >> createIteratorOn: anObject [
	^ ReverseLinkedListIterator on: anObject nextLinkBlock: [ :link | link nextLink ] extractBlock: [ :link | link value ]
]

{ #category : #accessing }
ReverseLinkedListIteratorTest >> objectToWalk [
	^ (self iteratorWalk reversed as: LinkedList) firstLink
]
