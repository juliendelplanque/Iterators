"
I am an iterator for collections that can be accessed sequentially.

Internally, I use a reference to the collection to walk and the index of the element I am currently on.
"
Class {
	#name : #SequentialAccessIterator,
	#superclass : #Iterator,
	#instVars : [
		'sequenceableCollection',
		'currentIndex'
	],
	#category : #'Iterators-Core'
}

{ #category : #'instance creation' }
SequentialAccessIterator class >> on: aSequenceableCollection [
	^ self new
		initializeOn: aSequenceableCollection;
		yourself
]

{ #category : #accessing }
SequentialAccessIterator >> expectedUpToEndSize [
	^ sequenceableCollection size
]

{ #category : #testing }
SequentialAccessIterator >> hasNext [
	^ currentIndex < sequenceableCollection size
]

{ #category : #initialization }
SequentialAccessIterator >> initializeOn: aSequenceableCollection [
	sequenceableCollection := aSequenceableCollection.
	currentIndex := 0
]

{ #category : #accessing }
SequentialAccessIterator >> next [
	self checkHasNext.
	^ sequenceableCollection at: (currentIndex := self nextIndex)
]

{ #category : #private }
SequentialAccessIterator >> nextIndex [
	^ currentIndex + 1
]

{ #category : #accessing }
SequentialAccessIterator >> peek [
	self checkHasNext.
	^ sequenceableCollection at: self nextIndex
]
