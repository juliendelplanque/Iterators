Class {
	#name : #IteratorsConcatenater,
	#superclass : #IteratorsWrapper,
	#category : #'Iterators-Wrappers'
}

{ #category : #accessing }
IteratorsConcatenater >> next [
	^ (self wrappedIterators iterator outputTo: #hasNext selectIt) peek next
]

{ #category : #accessing }
IteratorsConcatenater >> peek [
	^ (self wrappedIterators iterator outputTo: #hasNext selectIt) peek peek
]
