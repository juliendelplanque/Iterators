Class {
	#name : #IteratorsList,
	#superclass : #Object,
	#instVars : [
		'iterators'
	],
	#category : #'Iterators-Wrappers'
}

{ #category : #adding }
IteratorsList >> add: anIterator [
	self iterators add: anIterator
]

{ #category : #initialization }
IteratorsList >> initialize [
	super initialize.
	self iterators: OrderedCollection new.
]

{ #category : #accessing }
IteratorsList >> iterator [
	"Returns an iterator that iterates on the iterators I hold."
	^ self iterators basicIterator
]

{ #category : #accessing }
IteratorsList >> iterators [
	^ iterators
]

{ #category : #accessing }
IteratorsList >> iterators: anObject [
	iterators := anObject
]
