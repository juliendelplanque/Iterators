"
I am an iterator for linked-lists.

Internally, I use
- a reference to the current link I am on,
- a block allowing to get the next link from the following (this block returns nil when an the end of the linked list), and
- a block to extract the actual object to be returned by #peek and #next from the link object.
"
Class {
	#name : #LinkedListIterator,
	#superclass : #Iterator,
	#instVars : [
		'nextLinkBlock',
		'currentLink',
		'extractObjectFromLinkBlock',
		'isAtBeginning',
		'linksStack'
	],
	#category : #'Iterators-Core'
}

{ #category : #'instance creation' }
LinkedListIterator class >> on: aValueLink nextLinkBlock: aBlockClosure extractBlock: anotherBlockClosure [
	^ self new
		initializeOn: aValueLink nextLinkBlock: aBlockClosure extractBlock: anotherBlockClosure;
		yourself
]

{ #category : #testing }
LinkedListIterator >> hasNext [
	^ self nextLink isNotNil
]

{ #category : #initialization }
LinkedListIterator >> initializeOn: object nextLinkBlock: aBlock extractBlock: anotherBlock [
	currentLink := object.
	nextLinkBlock := aBlock.
	extractObjectFromLinkBlock := anotherBlock.
	isAtBeginning := true
]

{ #category : #accessing }
LinkedListIterator >> next [
	self checkHasNext.
	currentLink := self nextLink.
	isAtBeginning := false.
	^ extractObjectFromLinkBlock value: currentLink
]

{ #category : #private }
LinkedListIterator >> nextLink [
	isAtBeginning
		ifTrue: [ ^ currentLink ].
	^ nextLinkBlock value: currentLink
]

{ #category : #accessing }
LinkedListIterator >> peek [
	self checkHasNext.
	^ extractObjectFromLinkBlock value: self nextLink
]
