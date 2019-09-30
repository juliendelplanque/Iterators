Class {
	#name : #WindowIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'windowSize'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
WindowIterator >> windowSize [
	^ windowSize
]

{ #category : #accessing }
WindowIterator >> windowSize: anObject [
	windowSize := anObject
]
