"
An IdentityDuplicateRemoverIteratorTest is a test class for testing the behavior of IdentityDuplicateRemoverIterator
"
Class {
	#name : #IdentityDuplicateRemoverIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
IdentityDuplicateRemoverIteratorTest >> createIteratorOn: anObject [
	^ (IdentityDuplicateRemoverIterator decorate: anObject)
]

{ #category : #accessing }
IdentityDuplicateRemoverIteratorTest >> iteratorWalk [
	^ {1/2. 1/2. 1. 6 }
]

{ #category : #accessing }
IdentityDuplicateRemoverIteratorTest >> objectToWalk [
	| oneHalf |
	oneHalf := 1/2.
	^ SequentialAccessIterator on: {1/2. oneHalf. oneHalf. 1. 6 }
]
