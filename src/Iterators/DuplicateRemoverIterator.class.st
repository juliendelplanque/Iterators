"
I remember object I encounter coming from the iterator I wrap and filter those that I have already seen.

This, I remove duplicated objects from the wrapped iterator.
"
Class {
	#name : #DuplicateRemoverIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'seen'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
DuplicateRemoverIterator >> decoratedIterator: anIterator [
	^ super decoratedIterator: anIterator
										| [ :item | seen add: item ] doIt
										| [ :item | seen includes: item ] rejectIt
]

{ #category : #initialization }
DuplicateRemoverIterator >> initialize [
	super initialize.
	seen := Set new.
]
