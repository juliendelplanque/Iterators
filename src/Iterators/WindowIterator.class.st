"
I am iterator providing a window on the iterator decorated.
Each time #next is called on me, the window is shifted of 1 and returned as an array.

For example:

((1 to: 10) iterator
	outputTo: (WindowIterator windowSize: 2))
	upToEnd ""#(#(1 2) #(2 3) #(3 4) #(4 5) #(5 6) #(6 7) #(7 8) #(8 9) #(9 10))""
"
Class {
	#name : #WindowIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'windowSize',
		'window',
		'reachedEnd'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #'instance creation' }
WindowIterator class >> windowSize: windowSize [
	^ self new
		windowSize: windowSize;
		yourself
]

{ #category : #testing }
WindowIterator >> hasNext [
	^ reachedEnd not
]

{ #category : #initialization }
WindowIterator >> initialize [
	super initialize.
	reachedEnd := false
]

{ #category : #initialization }
WindowIterator >> initializeWindow [
	window := DoubleLinkedList new.
	self decoratedIterator upTo: windowSize into: window
]

{ #category : #accessing }
WindowIterator >> next [
	| toReturn |
	toReturn := self peek.
	self decoratedIterator hasNext
		ifTrue: [
			window removeFirst.
			window addLast: self decoratedIterator next ]
		ifFalse: [ reachedEnd := true ].
	^ toReturn
]

{ #category : #accessing }
WindowIterator >> peek [
	self checkHasNext.
	window ifNil: [ self initializeWindow ].
	^ window asArray
]

{ #category : #accessing }
WindowIterator >> windowSize [
	^ windowSize
]

{ #category : #accessing }
WindowIterator >> windowSize: anObject [
	windowSize := anObject
]
