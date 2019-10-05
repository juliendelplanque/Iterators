"
I am an iterator that bufferize at least a subset of objects incoming from decorated stream.
"
Class {
	#name : #BufferizedIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'buffer'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #private }
BufferizedIterator >> bufferizeNext [
	"Fill the #buffer instance variable with a collection of next objects to return."
	^ self subclassResponsibility
]

{ #category : #accessing }
BufferizedIterator >> next [
	self checkHasNext.
	^ [ buffer ]
		ensure: [ buffer := nil ]
]

{ #category : #accessing }
BufferizedIterator >> peek [
	self checkHasNext.
	^ buffer
]
