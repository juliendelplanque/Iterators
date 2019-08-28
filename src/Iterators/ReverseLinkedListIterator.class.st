"
I am similar to my superclass but I do the walk in reverse order.
"
Class {
	#name : #ReverseLinkedListIterator,
	#superclass : #LinkedListIterator,
	#category : #'Iterators-Core'
}

{ #category : #converting }
ReverseLinkedListIterator >> asReverseIteratorFromCurrentLink [
	^ LinkedListIterator on: currentLink nextLinkBlock: nextLinkBlock extractBlock: extractObjectFromLinkBlock
]

{ #category : #testing }
ReverseLinkedListIterator >> hasNext [
	^ linksStack isNotEmpty
]

{ #category : #initialization }
ReverseLinkedListIterator >> initializeLinksStack [
	| linkedListIterator |
	linkedListIterator := LinkedListIterator on: currentLink nextLinkBlock: nextLinkBlock extractBlock: extractObjectFromLinkBlock.
	linksStack := Stack new.
	[ linkedListIterator hasNext ]
		whileTrue: [ linksStack push: linkedListIterator next ]
]

{ #category : #initialization }
ReverseLinkedListIterator >> initializeOn: object nextLinkBlock: aBlock extractBlock: anotherBlock [
	currentLink := object.
	nextLinkBlock := aBlock.
	extractObjectFromLinkBlock := anotherBlock.
	self initializeLinksStack
]

{ #category : #accessing }
ReverseLinkedListIterator >> next [
	self checkHasNext.
	^ linksStack pop
]

{ #category : #accessing }
ReverseLinkedListIterator >> peek [
	self checkHasNext.
	^ linksStack top
]
