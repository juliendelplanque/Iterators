"
I walk a tree breadth-first.
"
Class {
	#name : #BreadthFirstIterator,
	#superclass : #TreeIterator,
	#instVars : [
		'visitQueue'
	],
	#category : #'Iterators-Core'
}

{ #category : #testing }
BreadthFirstIterator >> hasNext [
	^ visitQueue isNotEmpty
]

{ #category : #initialization }
BreadthFirstIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	super initializeForRoot: anObject childrenBlock: aBlock.
	visitQueue := LinkedList with: anObject
]

{ #category : #accessing }
BreadthFirstIterator >> next [
	| next |
	self hasNext
		ifFalse: [ self signalAtEnd ].
	next := visitQueue removeLast.
	(childrenBlock value: next) do: [ :child |
		visitQueue addFirst: child ].
	^ next
]

{ #category : #accessing }
BreadthFirstIterator >> peek [
	self hasNext
		ifFalse: [ self signalAtEnd ].
	^ visitQueue last
]
