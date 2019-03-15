Class {
	#name : #IteratorIsAtEnd,
	#superclass : #Error,
	#instVars : [
		'iterator'
	],
	#category : #'Iterators-Errors'
}

{ #category : #signalling }
IteratorIsAtEnd class >> signalIterator: anIterator [
	^ self new
		iterator: anIterator;
		signal
]

{ #category : #accessing }
IteratorIsAtEnd >> iterator [
	^ iterator
]

{ #category : #accessing }
IteratorIsAtEnd >> iterator: anObject [
	iterator := anObject
]
