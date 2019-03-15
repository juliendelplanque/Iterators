Class {
	#name : #CollectIterator,
	#superclass : #IteratorDecoratorWithBlock,
	#category : #'Iterators-Decorators'
}

{ #category : #accessing }
CollectIterator >> next [
	^ self block value: super next
]

{ #category : #accessing }
CollectIterator >> peek [
	^ self block value: super peek
]
