Class {
	#name : #StreamIterator,
	#superclass : #Iterator,
	#instVars : [
		'stream'
	],
	#category : #'Iterators-Streams'
}

{ #category : #'instance creation' }
StreamIterator class >> stream: stream [
	^ self new
		stream: stream;
		yourself
]

{ #category : #testing }
StreamIterator >> hasNext [
	^ self stream atEnd not
]

{ #category : #accessing }
StreamIterator >> next [
	self checkHasNext.
	^ self stream next
]

{ #category : #accessing }
StreamIterator >> peek [
	self checkHasNext.
	^ self stream peek
]

{ #category : #accessing }
StreamIterator >> stream [
	^ stream
]

{ #category : #accessing }
StreamIterator >> stream: anObject [
	stream := anObject
]
