"
I am an iterator that skip a certain amount of objects (#count) returned by my decorated iterator.
"
Class {
	#name : #SkipIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'count',
		'skippedCount'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
SkipIterator >> count [
	^ count
]

{ #category : #accessing }
SkipIterator >> count: anObject [
	count := anObject
]

{ #category : #testing }
SkipIterator >> hasNext [
	[ skippedCount < self count ]
		whileTrue: [ 
			self decoratedIterator hasNext
				ifFalse: [ ^ false ].
			self decoratedIterator next.
			skippedCount := skippedCount + 1 ].
	^ super hasNext
]

{ #category : #initialization }
SkipIterator >> initialize [
	super initialize.
	skippedCount := 0.
]

{ #category : #accessing }
SkipIterator >> next [
	self checkHasNext.
	^ super next
]

{ #category : #accessing }
SkipIterator >> peek [
	self checkHasNext.
	^ super peek
]

{ #category : #printing }
SkipIterator >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self count printOn: aStream.
	aStream nextPut: $).
]
