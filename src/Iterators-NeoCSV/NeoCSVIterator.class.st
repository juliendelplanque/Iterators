"
I am an iterator on a NeoCSVReader.

I provide a way to make enter NeoCSVREader's object stream into Iterators framework.

Thus, one can decorate this iterator with any iterator decorator to transform incoming objects lazily.
"
Class {
	#name : #NeoCSVIterator,
	#superclass : #Iterator,
	#instVars : [
		'neoCSVReader',
		'next'
	],
	#category : #'Iterators-NeoCSV'
}

{ #category : #'instance creation' }
NeoCSVIterator class >> neoCSVReader: neoCSVReader [
	^ self new
		neoCSVReader: neoCSVReader;
		yourself
]

{ #category : #testing }
NeoCSVIterator >> hasNext [
	next ifNotNil: [ ^ true ].
	
	self neoCSVReader atEnd
		ifTrue: [ 
			next := nil.
		^ false ].
	
	next := self neoCSVReader next.
	^ true
]

{ #category : #accessing }
NeoCSVIterator >> neoCSVReader [
	^ neoCSVReader
]

{ #category : #accessing }
NeoCSVIterator >> neoCSVReader: anObject [
	neoCSVReader := anObject
]

{ #category : #accessing }
NeoCSVIterator >> next [
	next ifNotNil: [ 
		|toReturn|
		toReturn := next.
		next := nil.
		^ toReturn ].
	
	self checkHasNext.
	^ self next
]

{ #category : #accessing }
NeoCSVIterator >> peek [
	next ifNotNil: [ 
		^ next ].
	
	self checkHasNext.
	^ self peek
]
