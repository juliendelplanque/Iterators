"
I remember object I encounter coming from the iterator I wrap and filter those that I have already seen.

This, I remove duplicated objects from the wrapped iterator.
"
Class {
	#name : #DuplicateRemoverIterator,
	#superclass : #IteratorDecoratorWithInternalIterator,
	#instVars : [
		'seen'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
DuplicateRemoverIterator >> buildInternalIterator [
	^ [ :item | seen includes: item ] rejectIt outputTo: [ :item | seen add: item ] doIt
]

{ #category : #initialization }
DuplicateRemoverIterator >> initialize [
	super initialize.
	seen := Set new.
]
