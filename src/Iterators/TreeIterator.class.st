Class {
	#name : #TreeIterator,
	#superclass : #Iterator,
	#instVars : [
		'root',
		'childrenBlock'
	],
	#category : #'Iterators-Core'
}

{ #category : #'instance creation' }
TreeIterator class >> root: anObject childrenBlock: aBlock [
	^ self new
		initializeForRoot: anObject childrenBlock: aBlock;
		yourself
]

{ #category : #accessing }
TreeIterator >> expectedUpToEndSize [
	^ Float infinity
]

{ #category : #initialization }
TreeIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	root := anObject.
	childrenBlock := aBlock
]
