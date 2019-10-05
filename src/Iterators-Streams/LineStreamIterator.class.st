Class {
	#name : #LineStreamIterator,
	#superclass : #StreamIterator,
	#instVars : [
		'next'
	],
	#category : #'Iterators-Streams'
}

{ #category : #accessing }
LineStreamIterator >> next [
	next ifNotNil: [ 
		|toReturn|
		toReturn := next.
		next := nil.
		^ toReturn ].
	
	self peek.
	^ self next
]

{ #category : #accessing }
LineStreamIterator >> peek [
	next ifNotNil: [ 
		^ next ].
	
	self checkHasNext.
	
	next := self stream nextLine.
	^ next
]
