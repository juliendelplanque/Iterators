"
I am an iterator that limit the number of objects returned by my decorated stream that my clients can access.

For example,

LimitIterator new
	limit: 2;
	decorate: #(1 2 3 4 5) iterator;
	upToEnd. ""#(1 2)""
"
Class {
	#name : #LimitIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'seenCount',
		'limit'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #testing }
LimitIterator >> hasNext [
	^ seenCount < self limit and: [ super hasNext ]
]

{ #category : #initialization }
LimitIterator >> initialize [
	super initialize.
	seenCount := 0.
]

{ #category : #accessing }
LimitIterator >> limit [
	^ limit
]

{ #category : #accessing }
LimitIterator >> limit: anObject [
	limit := anObject
]

{ #category : #accessing }
LimitIterator >> maximalUpToEndSize [
	^ self limit
]

{ #category : #accessing }
LimitIterator >> next [
	self checkHasNext.
	seenCount := seenCount + 1.
	^ super next
]

{ #category : #accessing }
LimitIterator >> peek [
	self checkHasNext.
	^ super peek
]

{ #category : #printing }
LimitIterator >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self limit printOn: aStream.
	aStream nextPut: $).
]
